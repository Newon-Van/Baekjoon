#include <stdio.h>

int main ()
{
	int T;
	int W;
	int H;
	int N;
	int X;
	int Y;


	X = 1;
	Y = 1;

	scanf("%d", &T);
	while (T)
	{
		scanf("%d %d %d", &H, &W, &N);

		X += N / H;
		Y = N % H;

		if (Y == 0)
		{
			Y = H;
			X--;
		}

		if (X < 10)
			printf("%d0%d\n", Y, X);
		else
			printf("%d%d\n", Y, X);
		T--;
		X = 1;
	}
	return (0);
}
