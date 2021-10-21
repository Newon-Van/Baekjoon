#include <stdio.h>

int Solve(int A, int B, int C){
	int result = 1;

	while(B--) {
		result = result * A % C;
	}
	return result;
}

int main(){
	int A;
	int B;
	int C;
	scanf("%d %d %d", &A, &B, &C);
	int result = Solve(A,B,C);
	printf("%d", result);
	return 0;
}
