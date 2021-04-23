#include <stdio.h>

int main ()
{
	int arr[10];
	int i;
	int j;
	int dup;
	int flag;
	int result;

	dup = 0;
	flag = 0;
	result = 10;
	i = 0;
	while (i < 10)
	{
		scanf("%d", &arr[i]);
		arr[i] %= 42;
		i++;
	}

	i = 0;
	j = 1;
	while (i < 10)
	{
		while (j < 10)
		{
			if (arr[i] == arr[j])
				flag = 1;
			j++;
		}
		if (flag == 1)
			dup++;
		flag = 0;
		i++;
		j = i + 1;
	}

	result = result - dup;
	printf("%d", result);
	return (0);
}
