#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int N;
int* workHour;
int* workProfit;
int profit, max = 0;

void Init(int N){
    for (int i = 0; i < N; i++){
        scanf("%d %d", &workHour[i], &workProfit[i]);
    }
}

void Consult(int day){
    if (day > N){
        return;
    }
    
    if (profit > max){
        max = profit;
    }
    
    if (day == N){
        return;
    }
    
    profit += workProfit[day];   
    Consult(day + workHour[day]);
    profit -= workProfit[day];
    Consult(day + 1);
}

int main(){
    scanf("%d", &N);
    workHour = (int*)malloc(sizeof(int) * N);
    workProfit = (int*)malloc(sizeof(int) * N);
    Init(N);
    
    Consult(0);
    printf("%d", max);
    
    free(workHour);
    free(workProfit);
}
