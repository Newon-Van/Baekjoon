//
//  1463_1로 만들기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/09.
//

var N = Int(readLine()!)!
var DP = [Int](repeating: 0, count: 1000001)

if N == 1 {
    print(0)
} else {
    for i in 2 ... N {
        DP[i] = DP[i - 1] + 1
        if i % 2 == 0 {
            DP[i] = min(DP[i], DP[i / 2] + 1)
        }
        if i % 3 == 0 {
            DP[i] = min(DP[i], DP[i / 3] + 1)
        }
    }

    print(DP[N])
}
