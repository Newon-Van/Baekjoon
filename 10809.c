#include <stdio.h>

int		*ft_init()
{
	static int check[26];
	int i;
	i = 0;

	while (i < 26)
	{
		check[i] = -1;
		i++;
	}
	return (check);
}

char		*ft_alphabet()
{
	static char alphabet[27];
	int i;
	char a;

	i = 0;
	a = 'a';

	while (i < 26)
	{
		alphabet[i] = a;
		i++;
		a++;
	}
	alphabet[26] = 0;
	return (alphabet);
}

int 		main ()
{
	char s[100];
	char *alphabet;
	int *check;
	int i;
	int j;

	scanf("%s", s);
	alphabet = ft_alphabet();
	check = ft_init();
	i = 0;
	j = 0;

	while (s[i])
	{
		while (alphabet[j])
		{
			if (s[i] == alphabet[j])
			{
				check[j] = i;
				alphabet[j] = 'A';
			}
			j++;
		}
		j = 0;
		i++;
	}
	i = 0;
	while (i < 26)
	{
		printf("%d ", check[i]);
		i++;
	}
	return (0);
}
