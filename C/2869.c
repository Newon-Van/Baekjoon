#include <stdio.h>

int main ()
{
	int A;
	int B;
	int V;
	int N;

	scanf("%d", &A);
	scanf("%d", &B);
	scanf("%d", &V);
	N = 1;

	if (A >= V)
	{
		printf("%d", N);
		return (0);
	}

	N += (V - A) / (A - B);
	if ( (V-A) % (A-B) != 0)
		N++;
	printf("%d", N);
	return (0);
}
