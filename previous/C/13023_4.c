#include <stdio.h>

typedef struct qNode{
    struct qNode* next;
    int data;
}Node;

Node node[2000];
Node* queue[2000];
int visit[2000];
int N, M;
int result = 0;

void Input(){
    int u, v;
    for(int i = 1; i <= M; i++){
        scanf("%d %d", &u, &v);
        node[i].data = u;
        node[i].next = queue[u];
        queue[u] = &node[i];
    }
}

void DFS(int depth, int count){
    if(result == 1){
        return;
    }
    
    if(count == 4){
        result = 1;
        return;
    }
    
    for (int i = 0; i <= M; i++){
        if(node[depth].next != NULL && visit[node[depth].next->data] == 0){
            visit[node[depth].next->data] = 1;
            DFS(node[depth].next->data, count + 1);
            visit[node[depth].next->data] = 0;
        }
    }
}

int main(){
    scanf("%d %d", &N, &M);
    Input();
    for(int i = 0; i <= N; i++){
        if(visit[i] == 0){
            visit[i] = 1;
            DFS(i, 0);
            visit[i] = 0;
        }
        if(result == 1){
            printf("%d", result);
            return 0;
        }
    }
    
    printf("%d", result);
    return 0;
}
