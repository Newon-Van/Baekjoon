//
//  15644_N과 M(10).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(depth: Int, index: Int, trace: String) {
    if depth == M {
        guard !checker.contains(trace) else { return }
        
        result += "\(trace)\n"
        checker.insert(trace)
        return
    }
    
    for i in index ..< N {
        let value = trace.isEmpty ? "\(array[i])" : "\(trace) \(array[i])"
        dfs(depth: depth + 1, index: i + 1, trace: value)
    }
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var checker = Set<String>()
var result = ""

dfs(depth: 0, index: 0, trace: "")
print(result)
