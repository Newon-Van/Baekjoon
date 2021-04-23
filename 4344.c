#include <stdio.h>
#include <stdlib.h>

int main ()
{
	int C;
	int N;
	int i;
	int *arr;
	int aver;
	int count;
	double ratio;

	scanf ("%d", &C);
	aver = 0;
	count = 0;

	while (C > 0)
	{
		scanf ("%d", &N);
		arr = (int *)malloc(sizeof(int) * N);

		i = 0;
		while (i < N)
		{
			scanf("%d", &arr[i]);
			aver += arr[i];
			i++;
		}

		aver /= N;

		i = 0;
		while (i < N)
		{
			if (arr[i] > aver)
				count++;
			i++;
		}

		ratio = (double)count / (double)N * 100;
		printf("%.3f%%\n", ratio);
		free(arr);
		aver = 0;
		count = 0;
		C--;
	}

	return (0);
}
