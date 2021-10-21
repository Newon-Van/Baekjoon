#include <stdio.h>
#include <stdlib.h>

void pick(int n, int* bucket, int bucketSize, int k) {
	int i, lastIndex, smallest, item;
	if (k == 0) { //모두 뽑은 경우 print하고 return
		for (i = 0; i < bucketSize; i++)
			printf("%d ", bucket[i]);
		printf("\n");
		return;
	}
	lastIndex = bucketSize - k - 1; // 가장 최근에 뽑힌 수가 저장된 위치 index
	if (bucketSize == k) //처음 뽑는 경우
		smallest = 0;
	else
		smallest = bucket[lastIndex] + 1; //중복을 막기 위해 오름차순으로 뽑는다.
        								  //바로 전에 뽑은 수에 +1
	for (item = smallest; item < n; item++) { //smallest에서 n-1까지의 수에서 뽑는 경우
		bucket[lastIndex + 1] = item;
		pick(n, bucket, bucketSize, k - 1); //1개를 뽑았으므로 k-1개를 뽑는다
	}
}

int main(void) {
	int n, k;

	printf("Enter n: "); //n(0~n-1까지의 수) k(뽑을 수의 개수)를 사용자에게 입력받아
	scanf("%d", &n);
	printf("Enter k: ");
	scanf("%d", &k);

	int *bucket = (int*)malloc(sizeof(int)*k); //buckek 배열을 동적할당
	pick(n, bucket, k, k);

	free(bucket);
}
