#include <stdio.h>
#include <stdlib.h>

int	ft_abs(int check, int M)
{
	int result;

	result = M - check;
	if (result < 0)
		result *= -1;
	return (result);
}

int main ()
{
	int N;
	int M;
	int *arr;
	int i, j, h;
	int result;
	int check;

	scanf("%d %d", &N, &M);
	arr = malloc(sizeof(int *) * N);

	for (i = 0; i < N; i++)
		scanf("%d", &arr[i]);

	i = 0;
	j = 1;
	h = 2;
	check = 0;
	result = arr[0] + arr[1] + arr[2];
	if (result == M)
	{
		printf("%d", result);
		return (0);
	}
	else if (result > M)
	{
		while (i < N - 3)
		{
			while (j < N - 2)
			{
				while (h < N)
				{
					result = arr[i] + arr[j] + arr[h];
					if (result < M)
						break;
					h++;
				}
				if (result < M)
					break;
				j++;
				h = j + 1;
			}
			if (result < M)
				break;
			i++;
			j = i + 1;
			h = j + 1;
		}
	}

	while (i < N - 3)
	{
		while (j < N - 2)
		{
			while (h < N)
			{
				check = arr[i] + arr[j] + arr[h];
				if (check == M)
				{
					printf("%d", check);
					return (0);
				}
				else if (check < M)
				{
					if (ft_abs(check, M) < M - result)
						result = check;
				}
				h++;
			}
			j++;
			h = j + 1;
		}
		i++;
		j = i + 1;
		h = j + 1;
	}
	printf("%d", result);
	free(arr);
	return (0);
}
