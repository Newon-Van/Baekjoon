#include <stdio.h>
#define max 100

int board[max + 1][max + 1] = {0, };
int visit[max + 1][max + 1] = {0, };
int N, M;

void Init(){
    scanf("%d %d", &N, &M);
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < M; j++){
            scanf("%1d", &board[i][j]);
        }
    }
}

void BFS(){
    int count = 0;
    
    int heightQueue[max * max];
    int widthQueue[max * max];
    int enqueueHeight = 0;
    int enqueueWidth = 0;
    int dx[4] = {0, 0, -1, 1};
    int dy[4] = {-1, 1, 0, 0};
    int front = 0;
    int rear = 1;
    int position = 0;
    
    heightQueue[front] = 0;
    widthQueue[front] = 0;
    position = heightQueue[front] + widthQueue[front];
    visit[heightQueue[front]][widthQueue[front]] = 1;
    
    while(front < rear){
        if(heightQueue[front] + widthQueue[front] < position){
            front++;
            continue;
        }
       
        enqueueHeight = heightQueue[front];
        enqueueWidth = widthQueue[front];
        position = enqueueHeight + enqueueWidth;
        if(position == N + M){
            printf("%d", count);
            return;
        }
        front++;
        count++;
        
        for(int i = 0; i < 4; i++){
            int next_height = enqueueHeight + dx[i];
            int next_width = enqueueWidth + dy[i];
            
            if(position > next_height + next_width)
                continue;
            if(next_height < 0 || next_height >= N || next_width < 0 || next_width >= M)
                continue;
            if(!board[next_height][next_width] || visit[next_height][next_width])
                continue;
            
            heightQueue[rear] = next_height;
            widthQueue[rear] = next_width;
	    printf("%d %d\n", next_height, next_width);
            visit[next_height][next_width] = 1;
            rear++;
        }
    }
}

void Solve(){
    BFS();
}

int main(){
    Init();
    Solve();
}
