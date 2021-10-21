#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int Graph[2001][2001] = {0, };
int BFSvisit[2001] = {0, };
int Queue[2001] = {0, };
int N, M;
int relation = 4;

void Init(){
    int x;
    int y;
    for(int i = 0; i < M; i++){
        scanf("%d %d", &x, &y);
        Graph[x][y] = 1;
	Graph[y][x] = 1;
    }
}

bool BFS(int position){
    int count = 0;
    int front, rear = 0;
    int enqueue;
    
    Queue[rear] = position;
    BFSvisit[position] = 1;
    rear += 1;
    
    while(front < rear){
        enqueue = Queue[front];
	printf("enqueue = %d\n", enqueue);
	Queue[front] = 0;
        front++;
        
        for(int i = 1; i <= N; i++){
            if(Graph[enqueue][i] == 1 && BFSvisit[i] == 0){
                Queue[rear] = i;
                rear += 1;
		count++;
                BFSvisit[i] = 1;
            }
        }
        if(count >= relation){
		return true;
	}
    }

    return false;
}

int main(){
    bool check = false;
    scanf("%d %d", &N, &M);
    Init();
    for(int i = 0; i <= N; i++){
        if(BFSvisit[i] == 0){
		check = BFS(i);
		if(check){
			printf("1");
			return 0;
		}
	}	
    }
    printf("0");
}
