//
//  2559_수열.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/06.
//

var input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (input[0], input[1])

input = readLine()!.split(separator: " ").map{ Int($0)! }
var psum = [Int](repeating: 0, count: N + 1)
var result = Int.min

for i in 1 ... input.count {
    psum[i] = psum[i - 1] + input[i - 1]
}

for i in 0 ..< psum.count - K {
    result = max(result, psum[i + K] - psum[i])
}

print(result)

// 구간쿼리 -> 정적 : psum || 동적 : 펜윅트리
