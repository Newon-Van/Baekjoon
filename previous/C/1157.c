#include <stdio.h>

const char	*ft_alphabet()
{
	return "abcdefghijklmnopqrstuvwxyz";
}

int		main()
{
	char str[1000001];
	int i;
	int j;
	int h;
	int count;
	int flag;
	const char *alphabet;

	i = 0;
	j = 0;
	h = 0;
	count = 0;
	flag = -1;
	scanf("%s", str);
	alphabet = ft_alphabet();

	while (alphabet[j])
	{
		while (str[i])
		{
			if (alphabet[j] == str[i] || 
				(alphabet[j] - ('a' - 'A')) == str[i])
				count++;
			i++;
		}
		if (flag == count)
			h = -1;
		if (flag < count)
		{
			flag = count;
			h = j;
		}
		i = 0;
		count = 0;
		j++;
	}
	if (h == -1)
	{
		printf("?");
		return (0);
	}
	printf("%c", alphabet[h] - ('a' - 'A'));
	return (0);
}
