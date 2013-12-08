/*********************************************************
*	File Name   : camserver.cpp
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 21时51分20秒
*	Description : 树莓派视频服务器.
*	              
**********************************************************/
/* OpenCV头文件 */
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

/* 自有头文件 */
#include "../myport.h"

/* 系统头文件 */
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/epoll.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/timerfd.h>
#include <iostream>

#define JUDGE_LOOP(x) if (0 >= ret) {perror(x); close(clientfd); goto __mainloop;}
using namespace std;
using namespace cv;
CvCapture *capture = NULL;

/*********************************************************
*	Func Name   : start_cap
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 23时23分49秒
*	Description : 启动摄像头
*	              
**********************************************************/
int start_cap(void)
{
	capture = cvCaptureFromCAM(0);		//only one camera connected.
	if (capture)
	{
		return 0;
	}
	
	return -1;
}

/*********************************************************
*	Func Name   : takepic
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 22时11分02秒
*	Description : 捕捉图片送入缓存
*	              
**********************************************************/
int takepic(vector<uchar> &buf)
{
	Mat frame;
	vector<int> params;	

	frame = cvQueryFrame(capture);
	if (frame.empty())
	{
		perror("Error Capture:");
		return -1;
	}
	/* 图像压缩 */
	params.push_back(CV_IMWRITE_JPEG_QUALITY);
	params.push_back(75);

	imencode("test.jpg", frame, buf, params);
	LOG("Datasize = %ld\n", buf.size());

	return buf.size();
}


/*********************************************************
*	Func Name   : main
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月05日 星期四 21时57分12秒
*	Description : 主函数
*	              
**********************************************************/
int main(int argc, char **argv)
{
	int ret = 0;
	int sockfd = -1;		/* 使用一个socket实现1对1视频对传 */
	int clientfd = -1;		/* 客户端socket */
	int on = 1;				/* 端口重用的参数 */
	int framelength = 0;	/* 帧长度 */
	struct sockaddr_in hostaddr;	/* 主机绑定地址 */
	vector<char> buffer_in;			/* 输入缓存 */
	vector<uchar> buffer_out;		/* 输出缓存 */

	ret = daemon(1, 1);
	if (0 != ret)
	{
		printf("Make Daemon Error.\n");
		return 0;
	}

	printf("Make Daemon OK.\n");

	/* 打开摄像头 */
	ret = start_cap();
	if (0 > ret)
	{
		perror("Start Cap");
		return -1;
	}

	/* 创建socket，并且进行端口重用 */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (0 > sockfd)
	{
		LOG("ERROR: SOCKET Create Failed.\n");
		goto __exit;
	}
	ret = setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
	if (0 > ret)
	{
		LOG("REUSE ADDR AND PORT ERROR.\n");
		goto __exit;
	}

	/* 设置IPv4本机地址 */
	memset(&hostaddr, 0, sizeof(hostaddr));
	hostaddr.sin_family = AF_INET;
	hostaddr.sin_port = htons(CAMPORT);
	/* 绑定socket */
	ret = bind(sockfd, (struct sockaddr *)&hostaddr, sizeof(hostaddr));
	if (0 > ret)
	{
		LOG("ERROR: BIND PORT ERROR.\n");
		perror("BIND:");
		close(sockfd);
		goto __exit;
	}

	/* 开始监听端口 */
	ret = listen(sockfd, 20);
	if (0 > ret)
	{
		LOG("ERROR: LISTEN Failed.\n");
		close(sockfd);
		goto __exit;
	}

	/* 主循环 */
	while (1)
	{
__mainloop:
		clientfd = accept(sockfd, NULL, NULL);
		if (0 >= clientfd)
		{
			LOG("ERROR: Accept.\n");
			perror("Accept:");
			goto __mainloop;
		}

		while (1)	/* 读写数据小循环 */
		{
			buffer_in.resize(BUFINSIZE);
			ret = read(clientfd, buffer_in.data(), BUFINSIZE);
			JUDGE_LOOP("READ:");

			ret = takepic(buffer_out);
			JUDGE_LOOP("CAPTURE:");

			framelength = htonl(buffer_out.size());
			ret = write(clientfd, (void *)&framelength, 4);
			JUDGE_LOOP("WRITE LENGTH");
			ret = write(clientfd, buffer_out.data(), buffer_out.size());
			JUDGE_LOOP("WRITE:");
			printf("Send Data %d byte.\n", ret);
		}
	}
	

__exit:
	return 0;
}
