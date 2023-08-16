//
//  1149_RGB거리.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/10.
//

let N = Int(readLine()!)!
var homeDepot = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

for i in homeDepot.indices {
    homeDepot[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

dp[0][0] = homeDepot[0][0]
dp[0][1] = homeDepot[0][1]
dp[0][2] = homeDepot[0][2]

for i in 1 ..< N {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + homeDepot[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + homeDepot[i][1]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + homeDepot[i][2]
}

print(min(dp[N - 1][0], dp[N - 1][1], dp[N - 1][2]))
