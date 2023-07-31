#include <stdio.h>

int main(){
	int a;
	int b;
	int m;
	int result = 1;

	scanf("%d %d %d", &a, &b, &m);
	while(b--){
		result = result * a % m;
	}
	printf("%d", result);
}

