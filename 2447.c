#include <stdio.h>

void	ft_star()
{
	int i;
	int j;

	i = 0;
	j = 0;
	while (i < 3)
	{
		while (j < 3)
		{
			j++;
			if (i == 1 && j == 2)
				printf(" ");
			else
				printf("*");
		}
		printf("\n");
		j = 0;
		i++;
	}
}

int	ft_repeat(N)
{
	int i;
	i = 0;

	while (i < N/3)
	{
		ft_star();
		i++;
	}

	N--;
	if (N == 0)
		return (0);
	return (ft_repeat(N));
}

int main ()
{
	int N;

	scanf("%d", &N);
	N = (N/3) * (N/3);

	ft_repeat(N);
	return (0);
}
