#include <stdio.h>

int main ()
{
	int T;
	int A;
	int B;
	int result;

	scanf("%d", &T);
	A = 0;
	B = 0;
	result = 0;
	for (int i; i < T; i++)
	{
		scanf("%d", &A);
		scanf("%d", &B);
		result = A + B;
		printf("%d\n", result);
	}
	return (0);
}
