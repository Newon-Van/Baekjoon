#include <stdio.h>
#include <stdlib.h>

int main ()
{
	int N;
	double M;
	int i;
	double *arr;
	double aver;

	scanf("%d", &N);
	i = 0;
	arr = (double *)malloc(sizeof(double) * N);
	aver = 0;
	
	while (i < N)
	{
		scanf("%lf", &arr[i]);
		i++;
	}

	i = 0;
	M = arr[i];
	while (i < N)
	{
		if ( M < arr[i])
			M = arr[i];
		i++;
	}

	i = 0;
	while (i < N)
	{
		if ( arr[i] > 0 )
		{
			arr[i] /= M;
			arr[i] *= 100;
		}
		aver += arr[i];
		i++;
	}
	aver /= N;

	printf("%f", aver);
	free(arr);
	return (0);
}
