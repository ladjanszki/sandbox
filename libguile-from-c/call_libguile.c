/*
 * This is test file so I can check if I can call libguile from my C source files
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>


#include <libguile.h>



static void* register_functions(void* data)
{
  return NULL;
}


int main(int argc, char* argv[])
{
	printf("From new main\n");



	scm_with_guile(&register_functions, NULL);
	scm_shell(argc, argv);



	return 0;
}
