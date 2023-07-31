#include <stdio.h>

int main ()
{
	char s[1000000];
	int i;
	int count;
	int flag;

	i = 0;
	count = 0;
	flag = 0;
	scanf("%[a-z, A-Z, ' ']", s);
	
	if (s[i] != ' ')
		count++;
	while (s[i] != 0)
	{
		if (s[i] == ' ')
			flag = 1;
		if (s[i] != ' ' && flag == 1)
		{
			flag = 0;
			count++;
		}
		i++;
	}
	printf("%d", count);
	return (0);
}
