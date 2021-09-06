#include <stdio.h>

int main ()
{
	int n;
	int i;
	int result;

	i = 5;
	result = 0;
	while (i)
	{
		scanf("%d", &n);
		result += n*n;
		i--;
	}
	printf("%d", result % 10);
	return (0);
}
