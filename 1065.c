#include <stdio.h>

int main ()
{
	int n;
	int i;
	int han;
	int arr[3];

	scanf("%d", &n);
	i = 100;
	han = 99;

	if (n < 100)
		printf("%d", n);
	else if (n < 1000)
	{
		while (i <= n)
		{
			arr[0] = i / 100;
			arr[1] = (i / 10) % 10;
			arr[2] = i % 10;
			if (arr[0] - arr[1] == arr[1] - arr[2])
				han++;
			i++;
		}
		printf("%d", han);
	}
	else if (n == 1000)
		printf("144");
	return (0);
}
