#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct qNode{

	int Data;
	struct qNode* Next;

}Node;

typedef struct listQueue{

	Node* Front;
	Node* Rear;
	int size;

}listQueue;

void createQueue(listQueue** Queue){
	
	(*Queue) = (listQueue*)malloc(sizeof(listQueue));
	(*Queue)->Front = NULL;
	(*Queue)->Rear = NULL;
	(*Queue)->size = 0;

}

Node* createNode(int Data){

	Node* newNode = (Node*)malloc(sizeof(Node));
	
	newNode -> Data = Data;
	newNode -> Next = NULL;

	return newNode;
}

void deleteNode(Node* removeNode){

	free(removeNode->Data);
	free(removeNode);

}

Node* Peek(listQueue* Queue){
	return Queue->Front;
}

void Enqueue(listQueue* Queue, Node* newNode){

	if(Queue->size == 0){
		Queue->Front = newNode;
		Queue->Rear = newNode;
	}
	else {
		Queue->Rear->Next = newNode;
		Queue->Rear = newNode;
	}

	Queue->size++;
	return;
}

Node* Dequeue(listQueue* Queue){
	
	Node* tempNode = Queue->Front;

	if(Queue->size == 0){
		return NULL;
	}
	else if(Queue->size == 1){
		Queue->Front = NULL;
		Queue->Rear = NULL;
		Queue->size--;
	}
	else{
		Queue->Front = Queue->Front->Next;
		Queue->size--;
	}

	return tempNode;
}

void deleteQueue (listQueue* Queue){

	int count = Queue->size;
	while(count-- != 0){

		Node* temp = Dequeue(Queue);
		deleteNode(temp);

	}
	free(Queue);
}

int main(){

	int i;
	listQueue* Queue;

	createQueue(&Queue);
	Enqueue(Queue, createNode(0));
	Enqueue(Queue, createNode(1));
	Enqueue(Queue, createNode(2));
	Enqueue(Queue, createNode(3));
	Enqueue(Queue, createNode(4));

	Node* temp = Peek(Queue);

	printf("%d %d <-- this guy is at front of the queue\n", temp->Data[0], temp->Data[1]);

	printf("current Queue -- [size:%d]\n",Queue->size);
	printf("front is : [%d][%d]\n", Queue->Front->Data[0], Queue->Front->Data[1]);
	printf("rear is : [%d][%d]\n", Queue->Rear->Data[0], Queue->Rear->Data[1]);

	Node* horse = Queue->Front;

	for(int i = 0; i<(Queue->size);i++){
		printf("%d %d\n", horse->Data[0], horse->Data[1]);
		horse = horse->Next;
	}

	horse = Dequeue(Queue);
	horse = Dequeue(Queue);

	printf("\n--Current Queue--[size:%d]\n\n",Queue->size);
	horse = Queue->Front;
	for(int i = 0; i < (Queue->size); i++){
		printf("%d %d\n", horse->Data[0], horse->Data[1]);
		horse = horse->Next;
	}

	deleteQueue(Queue);

}
