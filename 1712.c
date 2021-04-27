#include <stdio.h>

int main ()
{
	int A;
	int B;
	int C;
	int N;
	int result;

	result = 0;

	scanf("%d", &A);
	scanf("%d", &B);
	scanf("%d", &C);

	if (B >= C)
		printf("-1");
	else
	{
		N = (A / ( C - B) + 1);
		printf("%d", N);
	}
	return (0);
}
