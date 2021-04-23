#include <stdio.h>

int main ()
{
	int N;
	int count;

	count = 1;

	scanf("%d", &N);

	while (N > 0)
	{
		N /= 6;
		count++;
	}
	printf("%d", count);
	return (0);
}

