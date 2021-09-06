#include <stdio.h>

int main ()
{
	int N;
	int X;
	int Y;

	scanf("%d", &N);
	scanf("%d", &X);

	for(int i = 0; i < N; i++)
	{
		scanf("%d", &Y);
		if (X > Y)
			printf("%d ", Y);
	}
	return (0);
}
