#include <stdio.h>

int main ()
{
	int arr[8];
	int i;
	int check;

	check = -1;

	i = 0;
	while (i < 8)
	{
		scanf("%d", &arr[i]);
		i++;
	}

	i = 0;
	while (i < 7)
	{
		if (arr[i] < arr[i+1])
			check = 0;
		if (arr[i] > arr[i+1])
			check = 1;
		if (arr[i] < arr[i+1] && check == 1)
			check = 2;
		if (arr[i] > arr[i+1] && check == 0)
			check = 2;
		i++;
	}
	if (check == 0)
		printf("ascending\n");
	if (check == 1)
		printf("descending\n");
	if (check == 2)
		printf("mixed\n");
	return (0);
}
