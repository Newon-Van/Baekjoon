#include <stdio.h>

int ft_pibonacci(int n)
{
	if (n == 0 || n == 1)
		return (1);
	else
		return (ft_pibonacci(n - 1) + ft_pibonacci(n - 2));
	return (0);
}

int main ()
{
	int n;

	scanf("%d", &n);
	if (n == 0)
	{
		printf("0");
		return (0);
	}
	printf("%d", ft_pibonacci(n-1));
	return (0);
}
