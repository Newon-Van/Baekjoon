#include <stdio.h>
#include <stdlib.h>

int N, M;
int arr[1001][1001] = {0, };
int deg[1001] = {0, };
int visit[1001] = {0, };

void Init(){
    scanf("%d %d", &N, &M);
    int u, v;
    for(int i = 1; i <= M; i++){
	scanf("%d %d", &u, &v);
        arr[u][deg[u]] = v;
        deg[u]++;
        arr[v][deg[v]] = u;
        deg[v]++;
    }
}

void DFS(int node){
    visit[node] = 1;
    
    for(int i = 0; i <= N; i++){
        if(!visit[arr[node][i]]){
            DFS(arr[node][i]);
        }
    }
}

int main(){
    Init();
    int count = 0;
    
    for(int i = 1; i <= N; i++){
        if(!visit[i]){
	    DFS(i);
	    count++;
	}
    }
    printf("%d", count);
}
