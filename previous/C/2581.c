#include <stdio.h>

int ft_prime_check(int sort, int M)
{
	int check;
	int result;

	result = 0;
	while ( sort < M)
	{
		check = M % sort;
		if (check == 0)
			break;
		sort++;
	}

	if (sort == M && sort != 1)
		result++;
	return (result);
}

int main ()
{
	int M;
	int N;
	int sort;
	int result;
	int minimum;

	scanf("%d", &M);
	scanf("%d", &N);
	sort = 2;
	result = 0;
	minimum = 0;

	while (sort * sort < M)
		sort++;

	while (M <= N)
	{
		if (ft_prime_check(sort, M))
			result += M;
		
		if (ft_prime_check(sort, M) && minimum == 0)
			minimum = M;
		
		M++;
	}

	if (result == 0)
		printf("-1");
	else
	{
		printf("%d\n", result);
		printf("%d", minimum);
	}
	return (0);
}
