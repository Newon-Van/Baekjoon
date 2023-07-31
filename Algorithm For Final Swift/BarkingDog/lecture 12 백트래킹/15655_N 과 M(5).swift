//
//  15655_N 과 M(5).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(depth: Int, trace: String) {
    if depth == M {
        result += "\(trace)\n"
        return
    }
    
    for i in 0 ..< N {
        if visited[i] { continue }
        let value = trace.isEmpty ? "\(array[i])" : "\(trace) \(array[i])"
        visited[i] = true
        dfs(depth: depth + 1, trace: value)
        visited[i] = false
    }
}


let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var visited = [Bool](repeating: false, count: N)
var result = ""

dfs(depth: 0, trace: "")
print(result)
