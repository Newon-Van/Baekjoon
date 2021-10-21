#define _CRT_SECURE_NO_WARNINGS
#define MAX_VERTEX_NUM 20001
#include <stdio.h>
#include <stdlib.h>
int color[MAX_VERTEX_NUM];  // 색
int bp;                     // 이분 그래프 확인 변수
/* 그래프 정점 구조체 */
typedef struct GraphNode {
	int v_id;                  // 정점
	struct GraphNode* next;    // 다음 정점
}GraphNode;
/* 그래프 전체 구조체 */
typedef struct GraphType {
	int v_num;                 // 정점의 개수
	GraphNode* adj[MAX_VERTEX_NUM];
}GraphType;
GraphType graph;
/* 그래프 초기화 함수 */
void InitGraph(GraphType* g, int v_cnt) {
	/* 정점의 개수 및 연결, 색 초기화 */
	g->v_num = v_cnt;
	for (int i = 1; i <= v_cnt; i++) {
		g->adj[i] = NULL;
		color[i] = 0;
	}
}
/* u -> v 간선 추가 함수 */
void InsertEdge(GraphType* g, int u, int v) {
	/* 새로운 노드 생성 */
	GraphNode* node = (GraphNode*)malloc(sizeof(GraphNode)); 
	/* 새로운 노드 정보 할당 및 연결 */
	node->v_id = v;            
	node->next = g->adj[u];       
	g->adj[u] = node;
}
/* 이분 그래프 확인 함수 */
void CheckBipartiteGraph(GraphType* g, int s_node) {
	GraphNode* p;
	/* 현재 노드에서 인접노드 탐색 */
	p = g->adj[s_node];
	/* 현재 노드의 인접노드 색 검사 */
	while (p != NULL) {
		/* 칠하지 않은 노드는 칠하기 */
		if (color[p->v_id] == 0) {
			color[p->v_id] = (color[s_node] * -1);
			CheckBipartiteGraph(g, p->v_id);
		}
		/* 인접노드가 같은 색이면 이분 그래프가 아님 */
		else if (color[p->v_id] == color[s_node])
			bp = 0;
		/* 다음 인접노드로 */
		p = p->next;
	}
}
/* 그래프 출력 함수 */
void print_adj_list(GraphType* g) {
	GraphNode* p;
	for (int i = 1; i <= g->v_num; i++) {
		p = g->adj[i];
		printf("정점 %d의 인접노드: ", i);
		while (p != NULL) {
			printf("%d ", p->v_id);
			p = p->next;
		}
		printf("\n");
	}
}
int main() {
	int k, v, e;
	int node1, node2;
	scanf("%d", &k);
	while (k--) {
		bp = 1;
		scanf("%d %d", &v, &e);
		
		InitGraph(&graph, v);
		for (int i = 0; i < e; i++) {
			scanf("%d %d", &node1, &node2);
			/* 자기자신 사이클 = 하나만 삽입 */
			if (node1 == node2) {
				InsertEdge(&graph, node1, node2);
				continue;
			}
			/* 무방향 그래프 = 양쪽 다 삽입 */
			InsertEdge(&graph, node1, node2);
			InsertEdge(&graph, node2, node1);
		}
		/* 비연결 & 연결 그래프 모두 검사 */
		for (int i = 1; i <= v; i++) {
			if (color[i] == 0) {
				color[i] = -1;
				CheckBipartiteGraph(&graph, i);
			}
		}
		/* 이분 그래프 여부 출력 */
		if(bp)
			printf("YES\n");
		else
			printf("NO\n");
	}
	return 0;
}
