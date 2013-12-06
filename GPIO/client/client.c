/*********************************************************
*	File Name   : client.c
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月06日 星期五 14时56分07秒
*	Description : GPIO的客户端
*	              
**********************************************************/
/* 自有头文件 */
#include "../myport.h"

/* 系统头文件 */
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

#define JUDGE(x) if (0 >= ret) {perror(x); close(sockfd); goto __exit;}

/*********************************************************
*	Func Name   : main
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月06日 星期五 14时57分23秒
*	Description : 主函数
*	              
**********************************************************/
int main(int argc, char **argv)
{
	int ret;
	int sockfd = -1;
	int datalen = 0;
	int tmplen = 0;
	struct sockaddr_in addr;
	struct sockaddr *sockaddr = (struct sockaddr *)&addr;
	char buffer[BUFSIZE] = "";

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
	addr.sin_port = htons(GPIOPORT);
	addr.sin_family = AF_INET;

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
	printf("Usage: go(left/right/stop) + keeptime(ms)\n");

	while(1)
	{
__mainloop:
		ret = read(0, buffer, BUFSIZE);
		JUDGE("READ INPUT");
		datalen = ret;
		write(1, buffer, datalen);

		/* 写数据长度 */
		tmplen = htonl(ret);
		ret = write(sockfd, &tmplen, 4);
		JUDGE("Write Len");

		/* 写指令数据 */
		ret = write(sockfd, buffer, datalen);
		JUDGE("Write CMD");
		if (ret != datalen)
		{
			LOG("Error Write Command\n");
			goto __exit;
		}

		/* 读取ECHO */
		ret = read(sockfd, buffer, BUFSIZE);
		JUDGE("READ ECHO");
		write(1, buffer, ret);
	}

__exit:
	close(sockfd);
	return 0;
}
