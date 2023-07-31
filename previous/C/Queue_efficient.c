#include <stdio.h>

typedef struct qNode{
	struct qNode* next;
	int data;
}Node;

Node node[2000];

Node* Queue[2000];
int n, m;

void Init(){
	scanf("%d %d", &n, &m);
	for (int i = 1; i <= m; i++){
		int u, v;
		scanf("%d %d", &u, &v);
		node[i].data = v;
		node[i].next = Queue[u];
		Queue[u] = &node[i];
	}
}

void Solve(){
	for(int i = 1; i <= n; i++){
		printf("Node start from %d: ", i);
		for(Node* it = Queue[i]; it; it = it->next){
			printf("%d ", it->data);
		}
		printf("\n");
	}
}

int main(){
	Init();
	Pro();
}
