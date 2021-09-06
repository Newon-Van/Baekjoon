#include <stdio.h>

int ft_factorial(int N)
{
	if (N == 1)
		return (1);

	return ( N * ft_factorial(N - 1) );
}

int main ()
{
	int N;

	scanf("%d", &N);
	if (N == 0)
	{
		printf("1");
		return (0);
	}

	N = ft_factorial(N);
	printf("%d", N);
	return (0);
}
