#include <stdio.h>

int main ()
{
	int N;
	int tem;
	int try;
	int result;
	int check;

	scanf("%d", &N);
	tem = N;
	try = 0;

	while (tem > 0)
	{
		result = tem / 5;
		tem %= 5;

		result += tem / 3;
		tem %= 3;

		if (tem != 0)
		{
			try++;
			tem = N - (5 * try);
			result = try;
		}


		if (tem == 0)
			printf("%d", result);

		if (tem < 0)
		{
			printf("%d", N / 3);
			return (0);
		}
	}
	return (0);
}
