#include <stdio.h>

int ft_sqrt(int N)
{
	int sqrt;

	sqrt = 1;
	while (sqrt * sqrt <= N)
		sqrt++;
	return (sqrt);
}

int ft_star(int N)
{
	int i;
	int j;
	int sqrt;

	i = 1;
	j = 1;
	sqrt = ft_sqrt(N);

	while (i <= N)
	{
		while (j <= N)
		{
			if (i % 2 == 0 && j % 2 == 0 && i != (N/3) + 1)
				printf(" ");
			else if (i == (N / 3) + 1)
			{
				while ( i != sqrt + (N / 3) + 1)
				{
					printf(" ");
					i++;
				}
			}
			else
				printf("*");
			j++;
		}
		printf("\n");
		j = 1;
		i++;
	}
	return (0);
}

int main ()
{
	int N;

	scanf("%d", &N);

	ft_star(N);
	return (0);
}
