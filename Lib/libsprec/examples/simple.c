/*
 * simple.c
 * libsprec
 *
 * Created by Árpád Goretity (H2CO3)
 * on Sun 20/05/2012.
 */


#include <sprec/sprec.h>
#include <stdio.h>

/* My Change */
#define SYNCHRONOUS 1

#ifdef SYNCHRONOUS

int main(int argc, char *argv[])
{
	struct sprec_result *res;

	printf("Are you Ready?\n");
	getchar();
	res = sprec_recognize_sync(argv[1], strtod(argv[2], NULL));
	printf("%s (%lf)\n", res->text, res->confidence);
	sprec_result_free(res);
	return 0;
}

#else

void callback(struct sprec_result *res, void *data)
{
	printf("Thread: %lld\n", (long long)pthread_self());
	printf("%s (%lf)\n", res->text, res->confidence);
}

int main(int argc, char *argv[])
{
	pthread_t pid;
	void *retval;

	pid = sprec_recognize_async(argv[1], strtod(argv[2], NULL), callback, NULL);
	printf("Thread: %lld\n", (long long)pthread_self());
	pthread_join(pid, &retval);
	return 0;
}

#endif

