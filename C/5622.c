#include <stdio.h>

int main ()
{
	char str[16];
	int i;
	int count;

	scanf("%s", str);
	i = 0;
	count = 0;

	while (str[i])
	{
		if (str[i] <= 'R')
		{
			str[i] -= 'A' - 9;
			while (str[i] >= 3)
			{
				str[i] -= 3;
				count++;
			}
		}
		else if (str[i] == 'S')
			count += 8;
		else if (str[i] <= 'Y')
		{
			str[i] -= 'A' - 11; 
			while (str[i] >= 3)
			{
				str[i] -= 3;
				count++;
			}
			count -= 1;
		}
		else if (str[i] == 'Z')
			count += 10;
		i++;
	}
	printf("%d", count);
	return (0);
}
