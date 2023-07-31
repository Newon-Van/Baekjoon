#include <stdio.h>

int main() {
    int N;
    int M;
    
    scanf("%d, %d", &N, &M);

    for (int i = 1; i <= N; i++) {
	    for (int j = 1; j <= N; j++) {
		    if(i != j) {
			    printf("%d %d\n", i, j);
		    }
	    }
    }
    return 0;
}
