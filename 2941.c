#include <stdio.h>

int main ()
{
	char str[101];
	int i;
	int count;

	scanf("%s", str);
	i = 0;
	count = 0;

	while (str[i])
	{
		if ((str[i] == 'c' && str[i+1] == '=') 
			|| (str[i] == 'c' && str[i + 1] == '-')
			|| (str[i] == 'd' && str[i + 1] == '-')
			|| (str[i] == 'l' && str[i + 1] == 'j')
			|| (str[i] == 'n' && str[i + 1] == 'j')
			|| (str[i] == 's' && str[i + 1] == '=')
			|| (str[i] == 'z' && str[i + 1] == '='))
			{
				count++;
				i += 2;
			}
		else if ((str[i] == 'd' && str[i + 1] == 'z' && str[i + 2] == '='))
		{
			count++;
			i += 3;
		}
		else
		{
			count++;
			i++;
		}
	}
	printf("%d", count);
	return (0);
}
