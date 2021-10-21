#include <stdio.h>
#include <stdlib.h>

int arr[2001][2001] = {0, };
int* visit;
int N;
int M;
int result = 0;

// 시작 인접행렬 채우기
void Init(){
    int x, y;
    for(int i = 0; i < M; i++){
        scanf("%d %d", &x, &y);
        arr[x][y] = 1;
        arr[y][x] = 1;
    }
}

void DFS(int depth, int count){
    if(result == 1) // 한번 관계를 확인하면 더 이상 반복하지 않게 하기
        return;
    if(count >= 4){ // 친구관계 4인이 연결되면 확인
        result = 1;
        return;
    }


    
    for(int i = 0; i <= N; i++){ // depth 의 사람이 맺고있는 친구관계 확인
        if(arr[depth][i] == 1 && visit[i] == 0 && result != 1){
            visit[i] = 1;
            DFS(i, count+1); // 맺고있는 친구 기준으로 다시 dfs
            visit[i] = 0;    
        }
    }
}

int main(){
    scanf("%d %d", &N, &M);
    visit = (int*)malloc(sizeof(int) * N);
    
    Init();
    for(int i = 0; i <= N; i++){
        if(visit[i] == 0){
            visit[i] = 1;
            DFS(i, 0);
            visit[i] = 0;
        }
        if(result == 1)
            break;
    }
    
    printf("%d", result);
    free(visit);
}
