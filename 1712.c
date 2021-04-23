#include <stdio.h>

int main ()
{
	int A;
	int B;
	int C;
	int result;

	result = 0;

	scanf("%d", &A);
	scanf("%d", &B);
	scanf("%d", &C);

	while ((C * result) <= (A+(B * result)))
		result++;
	if (result == 0 || B >= C)
		printf("-1");
	else
		printf("%d", result);
	return (0);
}
