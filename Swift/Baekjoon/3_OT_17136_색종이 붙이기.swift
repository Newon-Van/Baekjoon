//
//  3_17136_색종이 붙이기.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/28.
//

import Foundation

func check(y: Int, x: Int, count: Int) -> Bool {
    if y + count > n || x + count > n {
        return false
    }
    for i in y ..< y + count {
        for j in x ..< x + count {
            if graph[i][j] == 0 {
                return false
            }
        }
    }
    
    return true
}

func draw(y: Int, x: Int, count: Int, value: Int) {
    for i in y ..< y + count {
        for j in x ..< x + count {
            graph[i][j] = value
        }
    }
}

func dfs(y: Int, x: Int, count: Int) {
    if count >= result {
        return
    }
    
    if x == n {
        dfs(y: y + 1, x: 0, count: count)
        return
    }
    
    if y == n {
        result = min(count, result)
        return
    }
    
    if graph[y][x] == 0 {
        dfs(y: y, x: x + 1, count: count)
        return
    }
    
    for size in stride(from: 5, to: 0, by: -1) {
        if map[size] == 5 {
            continue
        }
        
        if check(y: y, x: x, count: size) {
            map[size, default: 0] += 1
            draw(y: y, x: x, count: size, value: 0)
            dfs(y: y, x: x, count: count + 1)
            draw(y: y, x: x, count: size, value: 1)
            map[size]! -= 1
        }
    }
}

let n = 10
var graph = [[Int]](repeating: [Int](), count: n)
for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}
var result = Int.max
var map = [Int:Int]()
dfs(y: 0, x: 0, count: 0)
print(result == Int.max ? -1 : result)
