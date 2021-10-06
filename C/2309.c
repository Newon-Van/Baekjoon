#include <stdio.h>

int main() {
    int arr[9];
    int goal = 100;
    int check = 0;
    int temp;
    for(int i = 0; i < 9; i++){
       scanf("%d", &arr[i]);
    }
    int i;
    for(i = 0; i < 8; i++){
	    for(int j = i + 1; j < 9; j++){
		    if(arr[i] > arr[j]){
			    temp = arr[i];
			    arr[i] = arr[j];
			    arr[j] = temp;
		    }
	    }
    }

    for(i = 0; i < 9; i++){
	   goal -= arr[i];
	  if(goal == 0)
		  check = i;
    }
    

    return 0;
}
