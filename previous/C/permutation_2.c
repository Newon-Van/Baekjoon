#include <stdio.h>
#include <stdlib.h>

void pick(int *bucket, int n, int bucketSize, int k){
	int i, lastIndex, smallest, item;

	if (k == 0) {// 고를 것이 없으면 출력
		for (i = 0; i < bucketSize; i++)
			printf("%d ", bucket[i]);
		printf("\n");
		return;
	}

	lastIndex = bucketSize - k - 1; //picked array에서 마지막에 채워진 element의 index
	smallest = 1; //순열은 매번 전체 아이템에서 시작함

	for (item = smallest; item < n; item++) {
		int chosen = 0; //이미 뽑혔는지를 검사하기 위한 flag변수
        				//처음엔 false(0)으로 둔다.

		for (int j = 0; j <= lastIndex; j++) {
			if (bucket[j] == item) { //item이 이미 뽑힌 상태이면
				chosen = 1; //뽑힌 상태이므로 true(1)로 값을 바꾸고
				break; //멈춤
			}
		}

		if (chosen) 
			continue; //나왔으면 그 다음 아이템으로 넘어간다

		bucket[lastIndex + 1] = item; //나오지 않은 아이템을 넣는다
		pick(bucket, n, bucketSize, k - 1);
	}
}

int main(void) {
	int n, k;

	printf("Enter n: ");
	scanf("%d", &n);
	printf("Enter k: ");
	scanf("%d", &k);

	int *bucket = (int*)malloc(sizeof(int)*k);
	pick(bucket, n, k, k);

	free(bucket);
}
