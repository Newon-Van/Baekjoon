#include <stdio.h>
#include <stdlib.h>

int main ()
{
	int N;
	int X;
	int result;
	char *str;
	int i;

	scanf("%d", &N);
	str = (char *)malloc(sizeof(char *) * N);
	scanf("%s", str);
	i = 0;
	result = 0;
	while (str[i])
	{
		result += str[i] - '0';
		i++;
	}
	printf("%d", result);
	free(str);
	return (0);
}
