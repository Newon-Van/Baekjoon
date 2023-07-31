//
//  14497_주난의 난.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/28.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate {
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0),
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1)
]

func bfs() -> Bool {
    var result = true
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var queue = Queue<Coordinate>()
    queue.enqueue(junan)
    visited[junan.y][junan.x] = true
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            
            if visited[next.y][next.x] {
                continue
            }
           
            if graph[next.y][next.x] == "1" {
                graph[next.y][next.x] = "0"
                visited[next.y][next.x] = true
                continue
            }
            
            if criminal.y == next.y && criminal.x == next.x {
                return false
            }
            
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    
    return result
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[String]](repeating: [String](repeating: "", count: M), count: N)
input = readLine()!.split(separator: " ").map { Int($0)! }

let junan = Coordinate(x: input[1] - 1, y: input[0] - 1)
let criminal = Coordinate(x: input[3] - 1, y: input[2] - 1)
var result = 1

for i in 0 ..< N {
    graph[i] = readLine()!.map { String($0) }
}

while bfs() {
    result += 1
}

print(result)
