#include <stdio.h>
#include <stdlib.h>

long long sum(int *a, int n)
{
	int i;
	long long ans = 0;

	a = (int *)malloc(sizeof(int) * n);
	i = 0;

	while (i < n)
	{
		scanf("%d", &a[i]);
		ans += a[i];
		i++;
	}

	free(a);
	return (ans);
}

int main ()
{
	int n;
	int *a;
	int result;

	scanf("%d", &n);
	sum(a, n);
	return (0);
}
