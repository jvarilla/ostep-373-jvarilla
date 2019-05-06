#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "common.h"

int main(int argc, char *argv[]) {
    if (argc != 2) { 
	fprintf(stderr, "usage: mem <value>\n"); 
	exit(1); 
    } 
    int *p; 
    p = malloc(sizeof(int)); //Allocates enough memory to store an int
    assert(p != NULL);
    printf("(%d) addr pointed to by p: %p\n", (int) getpid(), p); //Print out memory address
    *p = atoi(argv[1]); // assign value to addr stored in p - Stores command line int argument in memory space allocated above
    while (1) {
	Spin(1); // Wait 1 second and then continue
	*p = *p + 1; // Increment the value stored in the allocated memory by one
	printf("(%d) value of p: %d\n", getpid(), *p);// Print out process id and value stored in allocated memory
    }
    return 0;
}

