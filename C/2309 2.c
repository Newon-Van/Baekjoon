#include <stdio.h>

void Solve(int arr[]){
    int total = 0;
    int over = 0;
    int i;
    int j;
    int temp;
    
    for (i = 0; i < 9; i++){
        total += arr[i];
    }
    over = total - 100;
    
    for (i = 0; i < 8; i++){
        for (j = i + 1; j < 9; j++){
            if (arr[i] + arr[j] == over){
		arr[i] = 0;
		arr[j] = 0;
                break;
            }
        }
	if (arr[i] * arr[j] == 0)
		break;
    }
    
    for (i = 0; i < 8; i++){
        for (j = i + 1; j < 9; j++){
            if(arr[i] > arr[j] && arr[i] != 0 && arr[j] != 0){
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    
    for (i = 0; i < 9; i++){
        if(arr[i] != 0){
            printf("%d\n",arr[i]);
        }
    }
    
}

int main(){
    int arr[9];
    for (int i = 0; i < 9; i++){
        scanf("%d", &arr[i]);
    }
    Solve(arr);
}
