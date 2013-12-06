/*********************************************************
*	File Name   : server.c
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月06日 星期五 14时24分48秒
*	Description : 树莓派的GPIO server
*	              
**********************************************************/
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

/* 自有头文件 */
#include "../myport.h"

/* Lib头文件 */
#include "bcm2835.h"

/* 管脚的使用与定义 */
#define OUTA RPI_V2_GPIO_P1_11
#define OUTB RPI_V2_GPIO_P1_12

#define JUDGE_LOOP(x) if (0 >= ret) {perror(x); close(clientfd); goto __mainloop;}

/*********************************************************
*	Func Name   : act_as
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月06日 星期五 14时39分05秒
*	Description : 根据指令进行操作
*	              
**********************************************************/
int act_as(char *command)
{
	char direct[BUFSIZE];
	int ms = 0;
	int ret = 0;

	if (0 == command[0])
	{
		return 0;
	}

	sscanf(command, "%s %d\n", direct, &ms);
	if (0 >= ms)
	{
		return 1;
	}

	/* 向前 */
	if (0 == strncmp(direct, "go", 2))
	{
		bcm2835_gpio_write(OUTA, HIGH);
		bcm2835_gpio_write(OUTB, HIGH);
	}
	/* 左转 */
	else if (0 == strncmp(direct, "left", 4))
	{
		bcm2835_gpio_write(OUTB, HIGH);
	}
	/* 右转 */
	else if (0 == strncmp(direct, "right", 5))
	{
		bcm2835_gpio_write(OUTA, HIGH);
	}
	/* 停止 */
	else
	{
		bcm2835_gpio_write(OUTA, LOW);
		bcm2835_gpio_write(OUTB, LOW);
		return 1;
	}

	/* 延时 */
	bcm2835_delay(ms);
	
	/* 停止 */
	bcm2835_gpio_write(OUTA, LOW);
	bcm2835_gpio_write(OUTB, LOW);
	return 1;
}

/*********************************************************
*	Func Name   : main
*	Project     : SmartCarWithCemera
*	Author      : Kent
*	Data        : 2013年12月06日 星期五 14时33分02秒
*	Description : 主程序
*	              
**********************************************************/
int main(int argc, char **argv)
{
	int ret = 0;
	int sockfd = -1;		/* 使用一个socket */
	int clientfd = -1;		/* 客户端socket */
	int on = 1;				/* 端口重用的参数 */
	int datalength = 0;		/* 接收数据长度 */
	int tmplen = 0;
	struct sockaddr_in hostaddr;	/* 主机绑定地址 */
	char buffer[BUFSIZE] = "";

	/* 初始化GPIO */
    if (!bcm2835_init())
	{
		perror("GPIO Init");
		return -1;
	}
	/* 初始化管脚 */
    bcm2835_gpio_fsel(OUTA, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_fsel(OUTB, BCM2835_GPIO_FSEL_OUTP);

	ret = daemon(1, 1);
	if (0 != ret)
	{
		printf("Make Daemon Error.\n");
		goto __exit;
	}

	printf("Make Daemon OK.\n");

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
	hostaddr.sin_port = htons(GPIOPORT);
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
			/* 读取数据长度 */
			ret = read(clientfd, &datalength, 4);
			JUDGE_LOOP("READ Datalen");
			datalength = ntohl(datalength);
			if (0 >= datalength)
			{
				close(clientfd);
				goto __mainloop;
			}

			/* 读取指令数据 */
			buffer[0] = 0;
			ret = read(clientfd, buffer, datalength);
			JUDGE_LOOP("READ DATA");
			LOG("Read Command is %s\n", buffer);

			/* 按照指令执行操作 */
			ret = act_as(buffer);
			JUDGE_LOOP("ACT");
			buffer[0] = '\0';
			LOG("DONE ACT\n");
			ret = write(clientfd, "DONE ACT\n", 10);
			JUDGE_LOOP("ECHO");
		}
	}
	
__exit:
    bcm2835_close();
	return 0;
}

