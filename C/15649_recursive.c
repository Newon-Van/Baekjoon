#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int arr[10] = {0, };
bool isusedArr[10] = {false,};
int N;
int M;

void Solve(int k){
    if(k == M){
        for (int i = 0; i < M; i++){
            printf("%d ", arr[i]);
        }
        printf("\n");
	return;
    }
    
    for (int i = 1; i <= N; i++){
        if(!isusedArr[i]){
            arr[k] = i;
            isusedArr[i] = true;
            Solve(k+1);
            isusedArr[i] = false;
        }
    }
}

int main(){
    scanf("%d %d", &N, &M);
    Solve(0);
}
