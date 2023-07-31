#include <stdio.h>

int ThreeDivideCount(int N){
    int count = 0;
    
    while(N % 3 == 0) {
        N /= 3;
        count += 1;
    }
    return count;
}

int TwoDivideCount(int N){
    int count = 0;
    
    while(N % 2 == 0) {
        N /= 2;
        count += 1;
    }
    return count;
}

int main (){
    int N;
    int count = 0;
    int temp;
    
    scanf("%d", &N);
    
    while(N > 1) {
        if(N % 3 == 0){
            count += ThreeDivideCount(N);
	    temp = ThreeDivideCount(N);
	    while(temp > 0) {
		    N = N / 3;
		    temp--;
	    }
	}
        if (N % 2 == 0) {
            count += TwoDivideCount(N);
	    temp = TwoDivideCount(N);
	    while(temp > 0) {
		    N = N / 2;
		    temp--;
	    }
	}  else {
            N -= 1;
            count++;
        }
    }
    printf("%d", count);
    return 0;
}
