//
//  15663_N과 M(9).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(depth: Int, trace: String) {
    if depth == M {
        if checker.contains(trace) { return }
        
        result += "\(trace)\n"
        checker.insert(trace)
        return
    }
    
    for i in 0 ..< N {
        guard !visited[i] else { continue }
        
        let value = trace.isEmpty ? "\(array[i])" : "\(trace) \(array[i])"
        visited[i] = true
        dfs(depth: depth + 1, trace: value)
        visited[i] = false
    }
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
var array = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var visited = [Bool](repeating: false, count: N)
var checker = Set<String>()
var result = ""

dfs(depth: 0, trace: "")
print(result)
