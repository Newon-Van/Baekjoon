#include <stdio.h>

int	g_arr[1000002];

void	ft_arr(int N)
{
	int prime;

	prime = 2;
	while(prime <= N)
	{
		g_arr[prime] = prime;
		prime++;
	}
}

void	ft_eratos(int N)
{
	int prime;
	int check;

	prime = 2;
	while (prime <= N)
	{
		check = prime;
		while (check <= N && g_arr[prime] != 0) 
		{
			check += prime;
			if (check <= 1000000)
				g_arr[check] = 0;
		}
		prime++;
	}
}

int main ()
{
	int M;
	int N;

	scanf("%d", &M);
	scanf("%d", &N);

	ft_arr(N);
	ft_eratos(N);
	while (M <= N)
	{
		if (g_arr[M] != 0)
			printf("%d\n", g_arr[M]);
		M++;
	}
	return (0);
}
