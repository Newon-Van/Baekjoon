#include <stdio.h>
#define max 50

int board[max + 1][max + 1];
int visit[max + 1][max + 1];
int w, h;
int result = 0;

void Init(){
    scanf("%d %d", &w, &h);
    if(!(w+h))
        return;
    for(int i = 0; i < h; i++){
        for(int j = 0; j < w; j++){
            scanf("%d", &board[i][j]);
        }
    }
}

void BFS(int height, int width){
    visit[height][width] = 1;
    
    int heightQueue[max + 1] = {0, };
    int widthQueue[max + 1] = {0, };
    int enqueueHeight = 0;
    int enqueueWidth = 0;
    int first = 0;
    int rear = 1;
    int dx[8] = {0, 0, -1, 1, -1, 1, -1, 1};
    int dy[8] = {-1, 1, 0, 0, -1, 1, 1, -1};
    
    heightQueue[0] = height;
    widthQueue[0] = width;
    
    while(first < rear){
        enqueueHeight = heightQueue[first];
        enqueueWidth = widthQueue[first];
        first++;
        
        for(int i = 0; i < 8; i++){
            int next_height = enqueueHeight + dy[i];
            int next_width = enqueueWidth + dx[i];
            
            if(next_height < 0 || next_height >= h || next_width < 0 || next_width >= w)
                continue;
            if(!board[next_height][next_width] || visit[next_height][next_width])
                continue;
            
            heightQueue[rear] = next_height;
            widthQueue[rear] = next_width;
            rear++;
            visit[next_height][next_width] = 1;
        }
    }
}

void Solve(){
    for(int i = 0; i < h; i++){
        for(int j = 0; j < w; j++){
            if(!visit[i][j] && board[i][j]){
                BFS(i, j);
                result++;
            }
        }
    }
    printf("%d\n", result);
    
    result = 0;
}

void Free(){
    for(int i = 0; i < h; i++){
        for(int j = 0; j < w; j++){
            board[i][j] = 0;
            visit[i][j] = 0;
        }
    }
}

int main(){
    while(1){
        Init();
        if(!(w + h))
            break;
        Solve();
        Free();
    }
}
