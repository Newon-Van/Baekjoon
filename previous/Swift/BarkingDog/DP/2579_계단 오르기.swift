//
//  2579_계단 오르기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/10.
//

func solution() {
    guard N != 1 else {
        print(square[1])
        return
    }

    dp[1][0] = square[1]
    dp[1][1] = square[1]
    dp[1][2] = 0
    dp[2][0] = square[2]
    dp[2][1] = square[2]
    dp[2][2] = square[1] + square[2]

    for i in 2 ... N {
        dp[i][1] = max(dp[i - 2][1], dp[i - 2][2]) + square[i]
        dp[i][2] = dp[i - 1][1] + square[i]
    }

    print(max(dp[N][1], dp[N][2]))
}

let N = Int(readLine()!)!
var square = [Int](repeating: 0, count: N + 1)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N + 1)

for i in 1 ... N {
    square[i] = Int(readLine()!)!
}

solution()
