#include <stdio.h>

int main ()
{
	int x, y, w, h;
	scanf("%d %d %d %d", &x, &y, &w, &h);

	int tem_x;
	int tem_y;

	tem_x = w - x;
	tem_y = h - y;


	if (tem_x < 0)
		tem_x *= -1;
	if (tem_y < 0)
		tem_y *= -1;

	if ( x <= tem_x && x <= tem_y && x <= y)
		printf("%d", x);

	else if ( tem_x <= x && tem_x <= tem_y && tem_x <= y)
		printf("%d", tem_x);

	else if ( y <= tem_y && y <= tem_x && y <= x)
		printf("%d", y);

	else if ( tem_y <= y && tem_y <= tem_x && tem_y <= x) 
		printf("%d", tem_y);

	return (0);
}
