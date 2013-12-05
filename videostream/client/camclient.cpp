/*********************************************************
*	File Name   : camclient.cpp
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 22时30分23秒
*	Description : Cam数据客户端
*	              
**********************************************************/
/* CV头文件 */
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

/* 自有头文件 */
#include "../myport.h"

/* 系统头文件 */
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <time.h>
#include <netdb.h>
#include <sys/types.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define JUDGE(x) if (0 >= ret) {perror(x); close(sockfd); return 0;}

using namespace std;
using namespace cv;
void detectAndDisplay(Mat frame);

/* 全局变量 */
String face_cascade_name = "haarcascade_frontalface_alt.xml";
String eyes_cascade_name = "haarcascade_eye_tree_eyeglasses.xml";
CascadeClassifier face_cascade;
CascadeClassifier eyes_cascade;
string win_name = "CamClient";
RNG rng(12345);

/*********************************************************
*	Func Name   : main
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 22时37分09秒
*	Description : 主函数
*	              
**********************************************************/
int main(int argc, const char **argv)
{
	Mat frame;
	int ret;
	int sockfd = -1;
	int framelength = 0;
	struct sockaddr_in addr;
	struct sockaddr *sockaddr = (struct sockaddr *)&addr;
	char buf_out[BUFINSIZE] = "CAPTURE";
	char buf_in[100000];
	char *datapointer = NULL;
	vector<uchar> databuf;

	/* 判断参数个数 */
	if (2 != argc)
	{
		LOG("ERROR INPUT PARAM, please use it like this: camclient 192.168.0.123\n");
		return -1;
	}

	/* 填写IP地址 */
	ret = inet_pton(AF_INET, argv[1], (void *)&(addr.sin_addr.s_addr));
	if (1 != ret)
	{
		perror("IPADDRESS:");
		return -1;
	}
	addr.sin_port = htons(CAMPORT);
	addr.sin_family = AF_INET;

	/* 加载xml文件 */
	if (!face_cascade.load(face_cascade_name)) {printf("Error Load\n"); return -1;}
	if (!eyes_cascade.load(eyes_cascade_name)) {printf("Error Load\n"); return -1;}

	/* 连接服务器 */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (socket < 0)
	{
		perror("SOCKET CREATE:");
		return -1;
	}
	if (0 != connect(sockfd, sockaddr, sizeof(addr)))
	{
		perror("CONNECT:");
		return -1;
	}
	printf("CONNECT OK.\n");

	while(1)
	{
__mainloop:

		/* 写请求 */
		ret = write(sockfd, buf_out, 8);
		JUDGE("WRITE REQUEST");

		/* 读数据 */
		ret = read(sockfd, (void *)&framelength, 4);
		JUDGE("READ LENGTH");
		framelength = ntohl(framelength);
		printf("Get Data %d byte.\n", framelength);
		datapointer = buf_in;
		while (datapointer < (buf_in + framelength))
		{
			ret = read(sockfd, datapointer, sizeof(buf_in - datapointer));
			datapointer += ret;
			JUDGE("READ DATA");
		}
		databuf.clear();
		databuf.resize(framelength);
		memcpy((void *)databuf.data(), (void *)buf_in, framelength);

		/* 解码 */
		frame = imdecode(databuf, 1);
		if (!frame.empty())
		{
			printf("Try to show\n");
			detectAndDisplay(frame);
			vector<int> param;
		}
		else
		{
			/* 错误帧 */
			perror("Error Data!\n");
			printf("DataSize:%ld\n", databuf.size());
			goto __mainloop;
		}
		waitKey(10);		//加上这个才能够显示图片
	}

	return 0;
}

/*********************************************************
*	Func Name   : detectAndDisplay
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 22时29分51秒
*	Description : 面部识别并且显示
*	              
**********************************************************/
void detectAndDisplay(Mat frame)
{
	std::vector<Rect> faces;
	Mat frame_gray;

	cvtColor(frame, frame_gray, CV_BGR2GRAY);
	equalizeHist(frame_gray, frame_gray);

	face_cascade.detectMultiScale(frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30));

	for (size_t i = 0; i < faces.size(); i++)
	{
		Point center(faces[i].x + faces[i].width*0.5, faces[i].y + faces[i].height*0.5);
		ellipse(frame, center, Size( faces[i].width*0.5, faces[i].height*0.5), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0);
		Mat faceROI = frame_gray( faces[i] );
		std::vector<Rect> eyes;

		//-- In each face, detect eyes
		eyes_cascade.detectMultiScale( faceROI, eyes, 1.1, 2, 0 |CV_HAAR_SCALE_IMAGE, Size(30, 30) );
		for( size_t j = 0; j < eyes.size(); j++ )
		{
			Point center( faces[i].x + eyes[j].x + eyes[j].width*0.5, faces[i].y + eyes[j].y + eyes[j].height*0.5 );
			int radius = cvRound( (eyes[j].width + eyes[j].height)*0.25 );
			circle( frame, center, radius, Scalar( 255, 0, 0 ), 4, 8, 0 );
		}
	}

	imshow(win_name, frame);
	return;
}

