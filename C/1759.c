#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

void Init(char unusedArr[], int C){
    char temp = 0;
    for(int i = 0; i < C; i++){
        scanf("%s", &unusedArr[i]);
    }
    for(int i = 0; i < C - 1; i++){
        for(int j = i + 1; j < C; j++){
            if(unusedArr[i] > unusedArr[j]){
                temp = unusedArr[i];
                unusedArr[i] = unusedArr[j];
                unusedArr[j] = temp;
            }
        }
    }
}

bool Check(char arr[], int L){
    int consonants = 0;
    int vowels = 0;
    for (int i = 0; i < L; i++){
        if(arr[i] == 'a' || arr[i] == 'e' || arr[i] == 'i' || arr[i] == 'o' || arr[i] == 'u'){
            vowels += 1;
        } else {
            consonants += 1;
        }
    }
    if (vowels < 1 || consonants < 2){
        return false;
    }
    return true;
}

void Solve(int k, int L, int C, char arr[], char unusedArr[]){
    if(k == L){
        if(Check(arr, L)){
            for(int i = 0; i < L; i++){
                printf("%c ", arr[i]);
            }
            printf("\n");
        }
    }
    
    for (int i = 0; i < C; i++){
        if(arr[k-1] < unusedArr[i]){
            arr[k] = unusedArr[i];
            unusedArr[i] = 0;
            Solve(k + 1, L, C, arr, unusedArr);
            unusedArr[i] = arr[k];
        }
    }
}

int main(){
    int L;
    int C;
    scanf("%d %d", &L, &C);
    char* arr;
    char* unusedArr;
    arr = (char*)malloc(sizeof(char) * L);
    unusedArr = (char*)malloc(sizeof(char) * C);
    
    Init(unusedArr, C);
    Solve(0, L, C, arr, unusedArr);
    
    free(arr);
    free(unusedArr);
}
