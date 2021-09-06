#include <stdio.h>

int main()
{
	int N;
	int i;
	int j;
	int check;
	int result;
	char arr[80];

	i = 0;
	j = 0;
	check = 0;
	result = 0;
	scanf ("%d", &N);

	while (i < N)
	{
		scanf("%s", arr);
		while (arr[j])
		{
			if (arr[j] == 'O')
				check++;
			if (arr[j] == 'X' || arr[j+1] == 0)
			{
				while (check > 0)
				{
					result += check;
					check--;
				}
			}
			j++;
		}
		printf("%d\n", result);
		check = 0;
		result = 0;
		j = 0;
		i++;
	}
}
