#include <stdio.h>

int	g_arr[10002];

void	ft_init()
{
	int i;
	i = 1;

	while (i < 10002)
	{
		g_arr[i] = i;
		i++;
	}
}

void	ft_eratos()
{
	int prime;
	int check;

	prime = 2;
	check = prime;
	while (prime <= 10002)
	{
		while (check <= 10002)
		{
			check += prime;
			if (check <= 10002)
				g_arr[check] = 0;
		}
		prime++;
		check = prime;
	}
}

int main ()
{
	int T;
	int n;
	int i;
	int j;

	scanf ("%d", &T);
	ft_init();
	ft_eratos();

	while (T)
	{
		scanf("%d", &n);

		i = n / 2;
		if (g_arr[i] == 0)
		{
			while (g_arr[i] == 0)
				i--;
		}
		j = i;

		while (i > 1)
		{
			while (g_arr[i] + g_arr[j] != n && g_arr[j] < n)
				j++;
			if (g_arr[i] + g_arr[j] == n)
				break;
			else if (g_arr[j] > n)
			{
				i--;
				while (g_arr[i] == 0)
					i--;
				j = i;
			}
		}
		if (i != 1)
			printf("%d %d\n", g_arr[i], g_arr[j]);
		T--;
	}
	return (0);
}
