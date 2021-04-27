#include <stdio.h>

int main ()
{
	int N;
	int arr[2] = {0, 1};
	int AP;
	int count;

	AP = 0;
	count = 1;

	scanf("%d", &N);

	while (1)
	{
		if (N == 1)
			break;
		AP += 6;
		arr[0] = arr[1];
		arr[1] = arr[0] + AP;
		count++;
		if (arr[1] >= N)
			break;
	}
	printf("%d", count);
	return (0);
}
