//
//  1182_부분 수열의 합.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(depth: Int, index: Int, sum: Int) {
    if sum == S {
        result += 1
    }
    if depth == array.count {
        return
    }
    
    for i in index ..< N {
        guard !visited[i] else { continue }
        visited[i] = true
        dfs(depth: depth + 1, index: i, sum: sum + array[i])
        visited[i] = false
    }
}


let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, S) = (input[0], input[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var visited = [Bool](repeating: false, count: N)
var result = 0

dfs(depth: 0, index: 0, sum: 0)
print(S == 0 ? result - 1 : result)
