#include <stdio.h>
#include <stdbool.h>

int N;
int count = 0;
int arr[15][15] = {0, };

bool CanLeftDiagnol(int col, int row){
    while(col >= 0 && row >= 0){
        if(arr[col][row] == 1){
            return false;
        }
        col -= 1;
        row -= 1;
    }
    return true;
}

bool CanRightDiagnol(int col, int row){
    while(col >= 0 && row <= N - 1){
        if(arr[col][row] == 1){
            return false;
        }
        col -= 1;
        row += 1;
    }
    return true;
}

bool CanCol(int col, int row){
    for(int i = col; i >= 0; i--){
        if(arr[i][row] == 1){
            return false;
        }
    }
    return true;
}

void Solve(int k){
    if (k == N){
        count += 1;
        return;
    }
    
    for(int row = 0; row < N; row++){
        if(CanCol(k, row) && CanLeftDiagnol(k, row) && CanRightDiagnol(k, row)){
            arr[k][row] = 1;
            Solve(k + 1);
            arr[k][row] = 0;
        }
    }
    return;
}

int main(){
    scanf("%d", &N);
    Solve(0);
    printf("%d",count);
}
