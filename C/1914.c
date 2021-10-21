#include <stdio.h>

long long g_count = 0;

void HanoiOver(int N,int A, int B, int C){
	int count = 0;
	if(N > 0){
		HanoiOver(N-1, A, C, B);
		g_count += 1;
		HanoiOver(N-1, B, A, C);
	}
}

void Hanoi(int N, int A, int B, int C){
	if(N > 0){
		Hanoi(N-1, A, C, B);
		printf("%d %d\n", A, C);
		g_count += 1;
		Hanoi(N-1, B, A, C);
	}
}

int main(){
	int N;
	scanf("%d", &N);
	if(N > 20){
		HanoiOver(N,1,2,3);
		printf("%d", g_count);
	} else {
		Hanoi(N,1,2,3);
		printf("%d",g_count);
	}
}
