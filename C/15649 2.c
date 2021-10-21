#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

void Print(int arr[], int size){

	for(int i = 0; i < size; i++){
		printf("%d", arr[i]);
	}
	printf("\n");
}

void StartArr(int N, int M, int startArr[]){
    for (int i = 0; i < M; i++){
        startArr[i] = i + 1;
    }
}

void FinalArr(int N, int M, int finalArr[]){
    for (int i = 0; i < M; i++){
        finalArr[i] = N;
	N--;
    }
}

void Next_permutation(int arr[], int size){
    int i = size - 1;
    int j = size - 1;
    int k = size - 1;
    int temp = 0;
    
    while (i > 0 && arr[i - 1] >= arr[i]) {
        i -= 1;
    }
    
    if(i == 0)
	    return;
    
    while (arr[i - 1] >= arr[j]) {
        j -= 1;
    }
    
    temp = arr[i - 1];
    arr[i - 1] = arr[j];
    arr[j] = temp;
    
    while(i < k) {
        temp = arr[k];
        arr[k] = arr[i];
        arr[i] = temp;
	i += 1;
	k -= 1;
    }
}

bool checking(int arr[], int finalArr[], int M){

    for (int i = 0; i <	M; i++) {
	    if(arr[i] != finalArr[i]) {
		    return false;
	    }
    }
    return true;

}

int main() {
    int N, M;
    scanf("%d %d", &N, &M);
    
    int* arr = (int*)malloc(sizeof(int) * M);
    StartArr(N, M, arr);
    int* finalArr = (int*)malloc(sizeof(int) * M);
    FinalArr(N, M, finalArr);

    while(checking(arr, finalArr, M) == false) {
        Print(arr, M);
        Next_permutation(arr, M);
    }
    Print(arr, M);

    free(arr);
    free(finalArr);
    return 0;
}
