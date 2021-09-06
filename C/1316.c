#include <stdio.h>

char *ft_init(void)
{
	static char check[27];
	int i;

	i = 0;
	while (i < 28)
	{
		check[i] = 1;
		i++;
	}
	return (check);
}

int main ()
{
	int N;
	int i;
	int flag;
	int count;
	char str[101];
	char *check;

	scanf("%d", &N);
	i = 0;
	flag = 0;
	check = ft_init();
	count = 0;

	while (N > 0)
	{
		scanf("%s", str);
		while (str[i])
		{
			if (str[1] == 0)
				break;
			if ( check [ (str[i] - 'a') ] != 1  && (str[i] != str[i - 1]))
			{
				flag = 1;
				break;
			}
			if ( check[ (str[i] - 'a') ] == 1 )
				check[ (str[i] - 'a') ]  = str[i];
			i++;
		}
		if (flag == 0)
			count++;
		N--;
		i = 0;
		flag = 0;
		check = ft_init();
	}
	printf("%d", count);
	return (0);
}
