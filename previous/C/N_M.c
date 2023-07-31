#include <stdio.h>

void Backtracking(int Arr[], int N, int M, int d) {
	printf("자 드가자 %d\n", d);
	for (int i = 1; i <= N; i++) {
		int k = 0;
		
		if (d == 0) 
			Arr[0] = i;
		else
		{
			for (k=0; k < d; k++) {
				if (Arr[k] == i) break;
			}
			if (k == d) {
				Arr[d] = i;
			}
			else continue;
		}
		
		if (M-1 == d) {
			for (int k = 0; k < M; k++)
				printf("%d ", Arr[k]);
			printf("\n");
		}
		else Backtracking(Arr, N, M, d + 1);
	}
}

int main() {
	int N, M;
	int Arr[8] = { 0, };
	scanf("%d%d", &N, &M);

	Backtracking(Arr, N, M, 0);
	return 0;
}
