#include <stdio.h>
#include <stdbool.h>
#define EDGE_MAX 200001
#define NODE_MAX 20001

typedef struct LIST{
    struct LIST* next;
    int value;
}Edge[EDGE_MAX];

struct LIST* Node[NODE_MAX];
int visit[NODE_MAX] = {0, };
int V, E;

void Input(){
    scanf("%d %d", &V, &E);
    Edge edge;
    
    int u, v;
    for(int i = 1; i <= E; i++){
        scanf("%d %d", &u, &v);
        edge[i].value = v;
        edge[i].next = Node[u];
        Node[u] = &edge[i];
    }
}

void Free(){
    for(int i = 1; i<= V; i++){
        visit[i] = 0;
        Node[i] = 0;
    }
}

bool DFS(int node, int group){
    visit[node] = group;
    
    for(struct LIST* it = Node[node]; it; it = it->next){
        if(visit[node] == visit[it->value]){
            return false;
        }
        if(!visit[it->value]){
            if(!DFS(it->value, -group))
		    return false;
        }
    }
    return true;
}

void Solve(){
    
    for(int i = 1; i <= V; i++){
        if(!visit[i]){
            if(!DFS(i, 1)){
                printf("NO\n");
                return;
            }
        }
    }
    
    printf("YES\n");
}

int main(){
    int k;
    scanf("%d", &k);
    
    while(k){
        Input();
        Solve();
        Free();
        k--;
    }
}
