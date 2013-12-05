/*********************************************************
*	File Name   : showimg.cpp
*	Project     : OpenCvPractice
*	Author      : 张天羽
*	Data        : 2013年12月01日 星期日 21时43分38秒
*	Description : 显示一张图片～～～
*	              
**********************************************************/
#include <vector>
#include <stdio.h>
#include <unistd.h>
#include <opencv2/opencv.hpp>

using namespace cv;


/*********************************************************
*	Func Name   : main
*	Project     : OpenCvPractice
*	Author      : 张天羽
*	Data        : 2013年12月01日 星期日 21时43分34秒
*	Description : 主函数
*	              
**********************************************************/
int main(int argc, char **argv)
{
	IplImage *img;
	Mat image;

	/* 检查参数 */
	if (2 != argc)
	{
		printf("Error Param!\n");
		return 0;
	}

	img = cvLoadImage(argv[1]);							/* 读取图片 */
	cvReleaseImage(&img);								/* 释放图片 */
	sleep(2);
	image = imread(argv[1], CV_LOAD_IMAGE_GRAYSCALE);	/* 第二种方式只读取灰度 */
	if (!image.data)									/* 检测是否有数据 */
	{
		printf("No Exist Data\n");
		return 0;
	}

	vector<int> params;
	params.push_back(CV_IMWRITE_PNG_COMPRESSION);
	params.push_back(9);
	imwrite("sample.png", image, params);


	return 0;
}
