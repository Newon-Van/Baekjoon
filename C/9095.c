:include <stdio.h>

int Solve(int sum, int n){
    if (sum == n)
        return 1;
    if (sum > n)
        return 0;
    int result = 0;
    
    for (int i = 1; i <= 3; i++){
        result += Solve(sum + i, n);
    }
    printf("Solve(%d %d) result : %d\n", sum, n, result);
    return result;
}

int main(){
    int T;
    int n;
    int result;
    scanf("%d", &T);
    while(T--){
        scanf("%d", &n);
        result = Solve(0, n);
	printf("%d", result);
    }
}
