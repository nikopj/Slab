#include <stdio.h>
#include <stdlib.h>
#include "add.h"
#include "add_initialize.h"
#include "add_terminate.h"

int main()
{
	int a = 20;
	int b = 40;

	add_initialize();
	int c = add(a,b);
	printf("%d\n",c);
	add_terminate();

	return 0;
}
