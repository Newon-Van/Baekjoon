#include <stdio.h>

int main ()
{
	int N;
	int prime;

	scanf("%d", &N);
	prime = 2;

	while (N > 1)
	{
		if (N % prime == 0)
		{
			printf("%d\n", prime);
			N /= prime;
		}
		else
			prime++;
	}
	return (0);
}
