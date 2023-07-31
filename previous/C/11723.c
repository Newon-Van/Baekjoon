#include <stdio.h>

void Add(int arr[], int N){
    if(arr[N-1] != N)
        arr[N-1] = N;
}

void Remove(int arr[], int N){
    if(arr[N-1] != 0)
        arr[N-1] = 0;
}

void Check(int arr[], int N){
    if(arr[N-1] != 0)
        printf("1\n");
    else
        printf("0\n");
}

void Toggle(int arr[], int N){
    if(arr[N-1] != 0){
        arr[N-1] = 0;
    } else if(arr[N-1] == 0){
        arr[N-1] = N;
    }
}

void All(int arr[]){
    for (int i = 0; i < 20; i++){
        arr[i] = i + 1;
    }
}

void Empty(int arr[]){
    for (int i = 0; i < 20; i++){
        arr[i] = 0;
    }
}

void ResetCommand(char command[]){
    for (int i = 0; i < 7; i++){
	command[i] = 0;
    }
}

int main() {
    int arr[20] = {0};
    char command[7];
    int number;
    int M;
    
    scanf("%d", &M);
    while(M > 0){
        scanf("%s", command);

        switch(command[1]){
            case 'd':
                scanf("%d", &number);
                Add(arr, number);
                break;
            case 'e':
                scanf("%d", &number);
                Remove(arr, number);
                break;
            case 'h':
                scanf("%d", &number);
                Check(arr, number);
                break;
            case 'o':
                scanf("%d", &number);
                Toggle(arr, number);
                break;
            case 'l':
                All(arr);
                break;
            case 'm':
                Empty(arr);
                break;
        }
        ResetCommand(command);
	M--;
    }
    return 0;
}
