//
//  15649_N과 M(1).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func dfs(_ n: Int, _ stack: [Int]) {
    if n == 0 {
        for element in stack {
            print(element, terminator: " ")
        }
        print()
        return
    }
    
    for i in 0 ..< N {
        if !visited[i] {
            visited[i] = true
            dfs(n - 1, stack + [array[i]])
            visited[i] = false
        }
    }
}

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var array = Array((1 ... N))
var visited = [Bool](repeating: false, count: N)

dfs(M, [])
