#include<stdio.h>

int arr[6] = { 1,2,3,4,5,6 };
int A[3];
int B[3];


void combination(int N, int R, int q)
{
	if (R == 0)
	{
		for (int i = q-1; i >= 0; i--)
		{
			printf("%d ", A[i]);
		}
		printf("\n");
	}
	else if (N < R)
	{
		return;
	}
	else
	{
		A[R - 1] = arr[N - 1];
		combination(N - 1, R - 1, q);
		combination(N - 1, R, q);
	}


}

int main(void)
{
	int N = 6;
	int R = 3;

	//permutation(N, R, R);
	combination(N, R, R);

	return 0;
}
