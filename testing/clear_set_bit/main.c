#include <stdio.h>

int
main(int argc, char *argv[])
{

#define NTH_BIT 4
	
	unsigned int addr = 0xffffffff;
	enum flags { clear, set };

	addr &= ~(1<<NTH_BIT);            
	printf("mb: clearing %dth bit %x of %x\n", NTH_BIT, addr, 0xffffffff);

	addr |= (1<<NTH_BIT);             
	printf("mb: setting %dth bit %x\n", NTH_BIT, addr);

	return 0;
}


