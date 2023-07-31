#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void Init(int arr[], int unusedArr[],int N, int M) {
	int i = 0;
	int j = 0;

	while (i < M) {
		arr[i] = i + 1;
		i++;
	}

	while (j < N) {
		if (j < M) {
			unusedArr[j] = 0;
		}
		else {
			unusedArr[j] = j + 1;
		}
		j++;	
	}

}

void Print(int arr[], int M) {
	for (int i = 0; i < M; i++) {
		printf("%d ", arr[i]);
	}
	printf("\n");
}

void LastArr(int arr[],int N, int M) {
	for (int i = 0; i < M; i++) {
		arr[i] = N;
		N--;
	}
}

bool CheckFinal(int arr[], int lastArr[], int M) {
	for (int i = 0; i < M; i++) {
		if(arr[i] != lastArr[i])
			return false;
	}
	return true;
}

int Smallest(int unusedArr[], int N){
	for (int i = 0; i < N; i++){
		if(unusedArr[i] != 0){
			return i;
		}
	}
	return -1;
}

void Combination(int arr[], int unusedArr[], int N, int M) {
	int i = M - 1;
	int temp = -1;
	int smallest = -1;

	while (i != -1) {
		for (int j = 0; j < N; j++){
			if(arr[i] < unusedArr[j] && arr[i] < N){
				printf("i = %d  j = %d  ",i, j);
				temp = arr[i];
				arr[i] = unusedArr[j];
				unusedArr[j] = 0;
				unusedArr[temp - 1] = temp;
				Print(arr, M);
			} 	
		}
		if (arr[i] == N) {
			arr[i] = 0;
			unusedArr[N - 1] = N;
			unusedArr[arr[i-1] - 1] = arr[i - 1];
			arr[i - 1] = unusedArr[Smallest(unusedArr, N)];
			unusedArr[Smallest(unusedArr, N)] = 0;
			arr[i] = unusedArr[Smallest(unusedArr, N)];
		}
		i -= 1;
	}

	Print(arr, M);
	return;
}

int main() {
	int N;
	int M;
	scanf("%d %d", &N, &M);

	int* arr = (int*)malloc(sizeof(int) * M);
	int* unusedArr = (int*)malloc(sizeof(int) * N);
	int* lastArr = (int*)malloc(sizeof(int) * M);
	Init(arr, unusedArr, N, M);
	LastArr(lastArr, N, M);
	Print(arr, M);
	/*

	   while(CheckFinal(arr, lastArr, M) != true) {
	   Combination(arr, unusedArr, N, M);
	   }
	   */
	Combination(arr, unusedArr, N, M);
	free(arr);
	free(lastArr);
	free(unusedArr);

	return 0;   
}
