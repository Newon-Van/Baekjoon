//
//  6603_로또.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/16.
//

import Foundation

func dfs(array: [Int], depth :Int, index: Int, trace: String) {
    if depth == 6 {
        guard !checker.contains(trace) else { return }
        
        result += "\(trace)\n"
        checker.insert(trace)
    }
    
    for i in index ..< array.count {
        if visited[i] { continue }
        
        let value = trace.isEmpty ? "\(array[i])" : "\(trace) \(array[i])"
        visited[i] = true
        dfs(array: array, depth: depth + 1, index: i + 1, trace: value)
        visited[i] = false
    }
}

var input = readLine()!.split { $0 == " " }.map { Int($0)! }
var visited = [Bool](repeating: false, count: input[0])
input.removeFirst()


var result = ""
var checker = Set<String>()

while !input.isEmpty {
    
    dfs(array: input, depth: 0, index: 0, trace: "")
    print(result)
    
    result = ""
    checker.removeAll()
    input = readLine()!.split { $0 == " " }.map { Int($0)! }
    visited = [Bool](repeating: false, count: input[0])
    input.removeFirst()
}
