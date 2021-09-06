#include <stdio.h>

int main ()
{

	struct location
	{
		int x;
		int y;
	};

	struct location a;
	struct location b;
	struct location c;

	int x, y;

	scanf("%d %d", &a.x, &a.y);
	scanf("%d %d", &b.x, &b.y);
	scanf("%d %d", &c.x, &c.y);

	if (a.x == b.x)
		x = c.x;
	else if (a.x == c.x)
		x = b.x;
	else if (b.x == c.x)
		x = a.x;

	if (a.y == b.y)
		y = c.y;
	else if (a.y == c.y)
		y = b.y;
	else if (b.y == c.y)
		y = a.y;

	printf("%d %d", x, y);
	return (0);
}
