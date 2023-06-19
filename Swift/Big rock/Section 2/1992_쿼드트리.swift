//
//  1992_쿼드트리.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/01.
//

func quard (y: Int, x: Int, size: Int) -> String {
    if size == 1 {
        return String(graph[y][x])
    }
    
    let now = graph[y][x]
    var result = ""
    
    for i in y ..< y + size {
        for j in x ..< x + size {
            if now != graph[i][j] {
                result += "("
                result += quard(y: y, x: x, size: size / 2)
                result += quard(y: y, x: x + size / 2, size: size / 2)
                result += quard(y: y + size / 2, x: x, size: size / 2)
                result += quard(y: y + size / 2, x: x + size / 2, size: size / 2)
                result += ")"
                return result
            }
        }
    }
    return String(now)
}

let N = Int(readLine()!)!ount: N)
var graph = [[Int]](repeating: [Int](), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.map{ Int(String($0))! }
}

print(quard(y: 0, x: 0, size: N))
