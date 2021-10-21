#include <stdio.h>

#define MAX 2010

int n, m;
int arr[MAX][MAX]; // 해당 정점과 연결된 정점
int visited[MAX];  // 방문 여부
int num_edge[MAX]; // 해당 정점이 가지는 간선의 개수

int dfs(int idx, int cnt)
{
    int i;

    if (cnt == 4)
        return 1;

    visited[idx] = 1; // idx 방문

    for (i = 0; i < num_edge[idx]; i++){
	    if(!visited[arr[idx][i]]){
		    if(dfs(arr[idx][i], cnt + 1))
			    return 1;
	    }
    }

    visited[idx] = 0;

    return 0;
}

int main(void)
{
    int i, d1, d2;

    scanf("%d %d", &n, &m);
    for (i = 0; i < m; i++)
    {
        scanf("%d %d", &d1, &d2);
        arr[d1][num_edge[d1]++] = d2;
        arr[d2][num_edge[d2]++] = d1;
    }

    for (i = 0; i < n; i++)
        if (dfs(i, 0))
        {
            printf("1\n");
            return 0;
        }

    printf("0\n");
    return 0;
}
