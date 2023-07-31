#include <stdio.h>
#include <stdlib.h>

int** arr;
int* deg;
int* visit;
int V, E;


void Init(){
    scanf("%d %d", &V, &E);
    arr = (int**)malloc(sizeof(int*) * V+1);
    for(int i = 0; i <= V; i++){
        arr[i] = (int*)malloc(sizeof(int) * E+1);
    }
    deg = (int*)malloc(sizeof(int) * E+1);
    visit = (int*)malloc(sizeof(int) * V+1);

    int u, v;
    for(int i = 0; i < E; i++){
        scanf("%d %d", &u, &v);
        arr[u][deg[u]] = v;
        deg[u]++;
    }
}

void Free(){
    for(int i = 0; i <= V; i++){
        free(arr[i]);
    }
    free(arr);
    free(deg);
    free(visit);
}

void DFS(int node){
    visit[node] = 1;
    
    for(int i = 0; i <= E; i++){
        if(!visit[arr[node][deg[i]]]){
            DFS(arr[node][deg[i]]);
        }
    }
}

int main(){
    int k, count;
    scanf("%d", &k);
    
    while(k){
        Init();
        count = 0;
        
        for(int i = 1; i <= V; i++){
            if(!visit[i]){
                DFS(i);
                count += 1;
                if (count > 2){
                    break;
                }
            }
        }
        
        if(count != 2)
            printf("NO\n");
        else
            printf("YES\n");
        Free();
	k--;
    }
}
