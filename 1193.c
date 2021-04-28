#include <stdio.h>

int main ()
{
	int X;
	int N;
	int direction;
	int AP;
	int adjust;

	scanf("%d", &X);
	direction = -1;
	AP = 0;
	N = 0;

	while (AP < X)
	{
		AP = (N*(N + 1))/2;
		adjust = ((N*(N-1))/2);
		N++;
		direction *= -1;
	}

	N--;
	X -= adjust;

	if (direction == -1)
		printf("%d/%d", N-X+1, X);
	if (direction == 1)
		printf("%d/%d", X, N-X+1);
	return (0);
}
