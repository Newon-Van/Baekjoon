//
//  9663_N-Queen.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func backTracking(depth: Int) {
    if depth == N {
        result += 1
        return
    }
    
    for i in 0 ..< N {
        guard !visited1[i] && !visited2[i + depth] && !visited3[depth - i + N - 1] else { continue }
        visited1[i] = true
        visited2[i + depth] = true
        visited3[depth - i + N - 1] = true
        
        backTracking(depth: depth + 1)
        
        visited1[i] = false
        visited2[i + depth] = false
        visited3[depth - i + N - 1] = false
    }
}

let N = Int(readLine()!)!
var result = 0

var visited1 = [Bool](repeating: false, count: N)
var visited2 = [Bool](repeating: false, count: 2 * N)
var visited3 = [Bool](repeating: false, count: 2 * N)

backTracking(depth: 0)
print(result)
