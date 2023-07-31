#include <stdio.h>

int N, M;
int arr[2001][2001];
int deg[2000];
int visit[2000];
int result = 0;

void Init(){
    scanf("%d %d", &N, &M);
    
    int a, b;
    for(int i = 1; i <= M; i++){
        scanf("%d %d", &a, &b);
        arr[a][deg[a]] = b;
        deg[a] += 1;
        arr[b][deg[b]] = a;
        deg[b] += 1;
    }
}

void DFS(int node, int count){
    if(result == 1)
        return;
    
    if(count >= 4){
        result = 1;
        return;
    }
    
    for(int i = 0; i <= deg[node]; i++){
        if(visit[arr[node][i]] == 0 && deg[node] != 0){
		printf("node : %d, next : %d, count : %d\n", node, arr[node][i], count);
            visit[arr[node][i]] = 1;
            DFS(arr[node][i],count+1);
            visit[arr[node][i]] = 0;
        }
    }
}

int main(){
    Init();
    for(int i = 0; i <= M; i++){
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


