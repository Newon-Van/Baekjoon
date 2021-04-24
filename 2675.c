#include <stdio.h>

int main ()
{
	char S[21];
	char P[161];
	int T;
	int R;
	int tem;
	int i;
	int j;
	
	scanf("%d", &T);
	i = 0;
	j = 0;

	while (T)
	{
		scanf("%d", &R);
		scanf("%s", S);
		while(S[i])
		{
			tem = R;
			while (tem)
			{
				P[j] = S[i];
				j++;
				tem--;
			}
			i++;
		}
		P[j] = 0;
		printf("%s\n", P);
		T--;
		i = 0;
		j = 0;
	}
	return (0);
}
