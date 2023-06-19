//
//  15650_N 과 M(2).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(index: Int, trace: [Int]) {
    if trace.count == M {
        trace.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    for i in index ..< N {
        if visited[i] { continue }
        visited[i] = true
        dfs(index: i + 1, trace: trace + [array[i]])
        visited[i] = false
    }
}


let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
let array = Array(1 ... N)
var visited = [Bool](repeating: false, count: N)

dfs(index: 0, trace: [])
