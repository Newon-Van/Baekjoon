#include <stdio.h>

int ft_prime(int n)
{
	int prime;

	prime = 2;
	while(prime * prime < n)
		prime++;
	return (prime);
}

int main ()
{
	int n;
	int tem;
	int prime;
	int check;
	int count;
	int tem_prime;

	scanf("%d", &n);
	check = 0;
	count = 0;

	while (n)
	{
		tem = n + 1;
		prime = ft_prime(tem);
		tem_prime = prime;
		while (tem <= (n * 2))
		{
			while (prime < tem)
			{
				if (tem % prime == 0)
				{
					check = 1;
					break;
				}
				prime++;
			}
			if (check == 0 && tem != 1)
				count++;
			tem++;
			prime = tem_prime;
			check = 0;
		}
		printf("%d\n", count);
		scanf ("%d", &n);
		check = 0;
		count = 0;
	}
	return (0);
}
