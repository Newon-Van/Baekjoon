#include <stdio.h>

int main ()
{
	int T;
	int N;
	int sort;
	int check;
	int result;

	scanf ("%d", &T);
	sort = 0;
	result = 0;

	while (T)
	{
		scanf("%d", &N);
		while ( (sort * sort) < N)
			sort++;
		while ( sort < N)
		{
			check = N % sort;
			if (check == 0)
				break;
			sort++;
		}
		
		if (sort == N && sort != 1)
			result++;
		sort = 0;
		T--;
	}
	printf("%d", result);
	return (0);
}
