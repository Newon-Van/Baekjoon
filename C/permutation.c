#include <stdio.h>

int arr[] = {1,2,3,4,5};

void swap(int *a, int *b ){
	int tmp;
	tmp = *a;
	*a = *b;
	*b = tmp;
}

void print_arr(){
	for(int i=0; i < sizeof(arr)/sizeof(int); i++)
		printf("%d ", arr[i]);
	printf("\n");
}

void permutation(int n, int r){

	// 탈출조건으로 r이 0이 되면 순열의 한 경우가 완료되었으므로 return합니다.
	if( r == 0){
		print_arr();
		return;
	}

	// 가장 끝에 있는 n-1의 위치의 원소와
	// 현재 보고 있는 i의 원소를 바꿔서
	// 재귀 함수에 넣어줍니다.

	// 1-2-3을 예로 들으면
	// 3(변수 i)과 3(변수 n-1)을 바꿉니다.
	// 그러면 3은 제일 뒤에 고정이고
	// 1과2를 둘이 바꾸는 경우가 생기므로
	// 1-2-3과 2-1-3이 생성됩니다.

	// 이제 다시
	// 2(변수 i)와 3(변수 n-1)을 바꿉니다.
	// 그러면 2는 제일 뒤에 고정이고
	// 1과3을 둘이 바꾸는 경우가 생기므로
	// 1-3-2와 3-1-2가 생성됩니다.

	// 숫자가 더 커지거나해도 같은 원리로 적용됩니다.
	for(int i=n-1; i>=0; i--){
		swap(&arr[i], &arr[n-1]);
		permutation(n-1, r-1);
		// 아래처럼 다시 swap을해줘야 마지막에 모두 끝났을 때 arr가 변화없게됩니다.
		swap(&arr[i], &arr[n-1]);
	}


}

int main() {
	permutation(sizeof(arr)/sizeof(int), sizeof(arr)/sizeof(int));
	return 0;
}
