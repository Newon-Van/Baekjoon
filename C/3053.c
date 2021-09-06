#include <stdio.h>

int main ()
{
	double R;
	double PI;

	scanf("%lf", &R);
	PI = 3.14159265358979323846;

	printf("%.6lf\n", (R * R) * PI);
	printf("%.6lf", (R * R) * 2);
	return (0);
}
