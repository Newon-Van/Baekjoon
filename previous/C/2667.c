#include <stdio.h>
#include <stdlib.h>
#define max 25

int board[max][max] = {0, };
int visit[max][max] = {0, };
int N = 0;

void Init(){
    scanf("%d", &N);
    int temp = 0;
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            scanf("%1d", &board[i][j]);
        }
    }
}

int BFS(int i, int j){
    visit[i][j] = 1;
    
    int RowQueue[626] = {0, };
    int ColQueue[626] = {0, };
    int front = 0;
    int rear = 1;
    int enqueue_row = 0;
    int enqueue_col = 0;
    int dx[4] = {0, 0, -1, 1};
    int dy[4] = {-1, 1, 0, 0};
    int count = 1;
    
    RowQueue[0] = i;
    ColQueue[0] = j;
    
    while(front < rear){
        enqueue_row = RowQueue[front];
        enqueue_col = ColQueue[front];
        front++;

        for(int i = 0; i < 4; i++){
            int next_row = enqueue_row + dx[i];
            int next_col = enqueue_col + dy[i];
            if(next_row < 0 || next_row >= N || next_col < 0 || next_col >= N)
                continue;
            if(!board[next_row][next_col] || visit[next_row][next_col])
                continue;
            RowQueue[rear] = next_row;
            ColQueue[rear] = next_col;
	        visit[RowQueue[rear]][ColQueue[rear]] = 1;
            rear++;
            count++;
        }
    }
    
    return count;
}

void Solve(){  
    int result[max*max/2 + 1] = {0, };
    int total = 0;
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            if(!visit[i][j] && board[i][j]){
                result[total] = BFS(i, j);
                total++;
            }
        }
    }
    
    int temp = 0;
    for(int i = 0; i < total - 1; i++){
        for(int j = i + 1; j < total; j++){
            if(result[i] > result[j]){
                temp = result[i];
                result[i] = result[j];
                result[j] = temp;
            }
        }
    }
    
    printf("%d\n", total);
    for(int i = 0; i < total; i++){
        printf("%d\n", result[i]);
    }
}

int main(){
    Init();
    Solve();
}


