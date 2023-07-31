#include <stdio.h>

int recursive(int N){
	if(N == 0)
		return 0;
	printf("%d ", N);
	return recursive(N - 1);
}

int recursiveUp(int N){
	if(N == 11)
		return 0;
	printf("%d ", N);
	return recursiveUp(N + 1);
}

int main() {
	int N;
	scanf("%d", &N);
	if(N == 10)
		recursive(N);
	else if (N == 1)
		recursiveUp(N);
}
