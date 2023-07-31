#include <stdio.h>

int N;

void Hanoi(int N, int A, int B, int C){
	if(N > 0){
		Hanoi(N-1,A,C,B);
		printf("%d 에서 %d 로 가장 맨 위의 원판 이동\n", A,C);
		Hanoi(N-1,B,A,C);
	}
}

int main(){
	scanf("%d", &N);
	Hanoi(N,1,2,3);
}
