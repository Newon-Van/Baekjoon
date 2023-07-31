//
//  2_1068.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/20.
//

import Foundation

struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count : Int {
        return input.count + output.count
    }
    
    mutating func enqueue(element : T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeFirst()
    }
}

struct Coordinate {
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]


func bfs() -> Bool {
    var queue = Queue<Coordinate>()
    queue.enqueue(element: Coordinate(y: 0, x: 0))
    var temp = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    var isClear = true
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        if graph[now.y][now.x] == 2 {
            graph[now.y][now.x] = 0
            continue
        }
        
        for direction in directions {
            let next = Coordinate(y: now.y + direction.y, x: now.x + direction.x)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            
            if graph[next.y][next.x] == 1 {
                graph[next.y][next.x] = 2
                isClear = false
                temp += 1
            }
            
            if visited[next.y][next.x] {
                continue
            }
            
            queue.enqueue(element: next)
            visited[next.y][next.x] = true
        }
    }
    
    if temp != 0 {
        cheese = temp
    }
    return isClear
}


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0], M = input[1]

var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}
var isClear = false
var time = 0
var cheese = 0

while isClear == false {
    isClear = bfs()
    time += 1
}

print(time - 1)
print(cheese)
