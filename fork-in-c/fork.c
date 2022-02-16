/*
 * Example code to refresh knowledge about fork and pipe between processes 
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>



//   <
//   >


#define MSGSIZE 16
char* msg1 = "hello, world #1";
char* msg2 = "hello, world #2";
char* msg3 = "hello, world #3";



int main()
{


  	// Creating a pipe 
	int my_pipe[2];

	// Special type for process ID (signed int)
	pid_t my_pid;

	// Buffer we are reading into from pipe
	char inbuf[MSGSIZE];



	// Opening the pipe
	// If creation fails exit with error 
	if(pipe(my_pipe) < 0) exit(1);


	//Forking
	//If forking fails exit with error
	if((my_pid = fork()) < 0) exit(1);

	// From parent
	if(my_pid != 0) {
		printf("From parent. PID: %d\n", my_pid);


		// Pushing the messages into the pipe
		write(my_pipe[1], msg1, MSGSIZE);
		write(my_pipe[1], msg2, MSGSIZE);
		write(my_pipe[1], msg3, MSGSIZE);

	}

	// From child 
	if(my_pid == 0) {
		printf("From child. PID: %d\n", my_pid);


		// Pulling messages out of the pipe
        	read(my_pipe[0], inbuf, MSGSIZE);
        	printf("%s\n", inbuf);

        	read(my_pipe[0], inbuf, MSGSIZE);
        	printf("%s\n", inbuf);

        	read(my_pipe[0], inbuf, MSGSIZE);
        	printf("%s\n", inbuf);


	}

  	

	return 0;
}





