#include <stdio.h>
#include <stdlib.h>

int	**ft_init(int **apt)
{
	int i;

	i = 0;
	while (i <= 14)
	{
		apt[0][i] = i;
		i++;
	}
	return (apt);
}

int	ft_cal(int **apt, int floor, int room)
{
	int i;

	i = 0;
	while (i <= room)
	{
		apt[floor][i] += apt[floor - 1][i];
		i++;
	}
	return (apt[floor][i]);
}

int main ()
{
	int T;
	int **apt;
	int k;
	int n;
	int floor;
	int room;

	scanf("%d", &T);
	while (T) 
	{
		scanf("%d", &k);
		scanf("%d", &n);
		apt = (int **) malloc (sizeof(int *) * k);
		for (int i = 0; i <= n; i++)
			apt[i] = (int *) malloc (sizeof(int) * 14);
		
		apt = ft_init(apt);

		int j = 0;
		for (int i = 0; i <= n; i++)
		{
			for (int j = 0; j <= 14; j++)
				printf("%d", apt[i][j]);
			j = 0;
		}

		
		/*floor = 1;
		while (floor <= n)
		{
			apt[floor][room] = ft_cal(apt, floor, room);
			floor++;
		}
		printf("%d", apt[k][n]);*/
		free(apt[0]);
		free(apt);
		T--;
	}
	return (0);
}
