#include <stdio.h>

int main ()
{
	int A;
	int B;
	int Sangsu_A;
	int Sangsu_B;

	scanf("%d", &A);
	scanf("%d", &B);
	Sangsu_A = 0;
	Sangsu_B = 0;

	while (A > 0)
	{
		Sangsu_A *= 10;
		Sangsu_A += A % 10;
		A /= 10;
	}
	while (B > 0)
	{
		Sangsu_B *= 10;
		Sangsu_B += B % 10;
		B /= 10;
	}
	if (Sangsu_A > Sangsu_B)
		printf("%d", Sangsu_A);
	else
		printf("%d", Sangsu_B);
	return (0);
}
