#include <stdio.h>

int	g_arr[10000];

void	ft_init()
{
	int i;

	i = 0;
	while (i < 10000)
	{
		g_arr[i] = i + 1;
		i++;
	}
}

void	ft_self_number()
{
	int n;
	int reset;
	int tem;
	int i;

	n = 1;
	reset = 1;
	tem = 1;
	i = 0;
	while (n <= 10000)
	{
		while (n > 0)
		{
			tem += n % 10;
			n /= 10;
		}
		n = tem;

		if (g_arr[n - 1] == n && n <= 10000)
			g_arr[n - 1] = 0;
		else if (n > 10000)
		{
			reset++;
			n = reset;
			tem = n;
		}
	}

	while (i < 10000)
	{
		if (g_arr[i] != 0)
			printf("%d\n", g_arr[i]);
		i++;
	}
}

int main ()
{
	ft_init();
	ft_self_number();
	return (0);
}
