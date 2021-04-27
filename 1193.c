#include <stdio.h>

int main ()
{
	int X;
	int start;
	int direction;
	int AP;

	scanf("%d", &X);
	start = 0;
	direction = -1;
	AP = 0;

	while (AP <= X)
	{
		start++;
		AP += start;
		direction *= -1;
	}

	if (direction == 1)
		printf("%d/%d", ((start+1) - (X-AP) + 1), (X-AP));
	else if (direction == -1)
		printf("%d/%d", (X-AP), ((start+1) - (X-AP) + 1));
		
	return (0);
}
