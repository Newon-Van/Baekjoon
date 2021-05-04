#include <stdio.h>

int main ()
{
	int a;
	int b;
	int c;

	scanf("%d %d %d", &a, &b, &c);
	while (a + b + c != 0)
	{
		if ((double)(a * a + b * b) == (double)(c * c))
			printf("right\n");
		else if ((double)(a * a + c * c) == (double)(b * b))
			printf("right\n");
		else if ((double)(b * b + c * c) == (double)(a * a))
			printf("right\n");
		else
			printf("wrong\n");
		scanf("%d %d %d", &a, &b, &c);
	}
	return (0);
}
