#include <stdio.h>

int	g_arr[246913] = { 0 };

void	ft_init(int N)
{
	int i;

	i = 0;
	while (i <= N)
	{
		g_arr[i] = 0;
		i++;
	}
}

void	ft_eratos(int N)
{
	int prime;
	int check;

	prime = 2;
	while (prime < N)
	{
		check = prime;
		while (check <= N) 
		{
			check += prime;
			if (check <= N)
				g_arr[check] = 1;
		}
		prime++;
	}
}

int main ()
{
	int M;
	int N;
	int count;

	scanf("%d", &M);
	N = 2 * M;
	count = 0;

	while (M)
	{
		M++;
		ft_eratos(N);
		while (M <= N)
		{
			if (g_arr[M] == 0 && M != 1)
				count++;
			M++;
		}
		printf("%d\n", count);
		count = 0;
		ft_init(N);
		scanf("%d", &M);
		N = 2 * M;
	}
	return (0);
}
