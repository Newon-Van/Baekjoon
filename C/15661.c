#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int N;
int ability[20][20];
bool canUsed[20] = {true, };
int min = 1000;

void Init(){
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            scanf("%d", &ability[i][j]);
        }
    }
}

void DFS(int k, int pos){
    if(k == N){
        int start = 0;
        int link = 0;
        int temp = 0;
        for(int i = 0; i < N; i++){
            for(int j = 0; j < N; j++){
                if(canUsed[i] && canUsed[j])
                    start += ability[i][j];
                if(!canUsed[i] && !canUsed[j])
                    link += ability[i][j];
            }
            temp = abs(start - link);
            if(temp < min)
                min = temp;
        }
    }
    
    for(int i = pos; i < N; i++){
        if(canUsed[i]){
            canUsed[i] = false;
            DFS(k + 1, pos + 1);
            canUsed[i] = true;
        }
    }
}


int main(){
    scanf("%d", &N);
    Init();
    DFS(0, 1);
    printf("%d", min);
}
