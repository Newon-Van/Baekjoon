//
//  9095_1, 2, 3 더하기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/09.
//

func findDP(_ start: Int) {
    for i in start - 3 ... start - 1 {
        if dp[i] == 0 {
            findDP(i)
        }
        
        dp[start] += dp[i]
    }
}

var dp = [Int](repeating: 0, count: 11)
dp[0] = 1
dp[1] = 2
dp[2] = 4

var testCase = Int(readLine()!)!

while testCase > 0 {
    let N = Int(readLine()!)!
    
    if dp[N - 1] == 0 {
        findDP(N - 1)
    }
    print(dp[N - 1])
    
    testCase -= 1
}
