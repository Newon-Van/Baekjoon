//
//  3_2589_보물섬.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/29.
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
    
    mutating func enqueue(_ element : T) {
        input.append(element)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate : Equatable {
    let y: Int
    let x: Int
    let time: Int
}

let directions = [
    Coordinate(y: -1, x: 0, time: 0),
    Coordinate(y: 1, x: 0, time: 0),
    Coordinate(y: 0, x: -1, time: 0),
    Coordinate(y: 0, x: 1, time: 0)
]

func find(start : Coordinate) -> Int{
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    queue.enqueue(start)
    visited[start.y][start.x] = true
    var result = 0
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        result = now.time
        
        for d in directions {
            let next = Coordinate(y: now.y + d.y, x: now.x + d.x, time: now.time + 1)
            
            if next.y < 0 || next.x < 0 || next.y >= N || next.x >= M {
                continue
            }
            if visited[next.y][next.x] || graph[next.y][next.x] == "W" {
                continue
            }
            
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    return result
}

let input = readLine()!.split(separator:  " ").map{ Int(String($0))! }
let (N, M) = (input[0], input[1])

var graph = [[String]](repeating: [String](repeating: " ", count: M), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.map{ String($0) }
}
var result = -1

for i in 0 ..< N {
    for j in 0 ..< M {
        if graph[i][j] == "L" {
            result = max(result, find(start: Coordinate(y: i, x: j, time: 0)))
        }
    }
}

print(result)
