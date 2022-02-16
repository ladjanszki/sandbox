/*
 * Example code tu refresh how pipes work in UNIX environment
 *
 * The pipe function is usually not used in a single process,
 * there is no point for the process to communicate to itself thrugh a pipe
 *
 * It is usually defined befor forking as a communication channel
 *
 * Pipes works as FIFO memory (just as pipes in real world)
 *
 */


#include <stdio.h>

// exit() is defined in stdlib.h
#include <stdlib.h>

// pipe() is defined in unistd.h
#include <unistd.h>



//   <
//   >


#define MSGSIZE 16
char* msg1 = "hello, world #1";
char* msg2 = "hello, world #2";
char* msg3 = "hello, world #3";



int main()
{


  	// Filedescriptors for the pipe
	// my_pipe[0] - read
	// my_pipe[1] - write 
	int my_pipe[2];

	// Buffer we are reading into from pipe
	char inbuf[MSGSIZE];



	// If creation of the pipe is not successful, exit with code 1
	if(pipe(my_pipe) < 0) exit(1);

	// Pushing the messages into the pipe
	write(my_pipe[1], msg1, MSGSIZE);
	write(my_pipe[1], msg2, MSGSIZE);
	write(my_pipe[1], msg3, MSGSIZE);

	// Pulling messages out of the pipe
        read(my_pipe[0], inbuf, MSGSIZE);
        printf("%s\n", inbuf);

        read(my_pipe[0], inbuf, MSGSIZE);
        printf("%s\n", inbuf);

        read(my_pipe[0], inbuf, MSGSIZE);
        printf("%s\n", inbuf);


  	

	return 0;
}





