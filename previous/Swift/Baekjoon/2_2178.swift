//
//  2_2178.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/15.
//

import Foundation

struct Queue<T> {
    var input: [T] = []
    var output: [T] = []
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    mutating func peek() -> T? {
        if input.isEmpty {
            return output.first
        } else {
            return input.last
        }
    }
    
    mutating func enqueue(element: T) {
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

struct Coordinate {
    var x: Int = 0
    var y: Int = 0
    var time: Int = 0
}

let directions: [Coordinate] = [
    Coordinate(x: 0, y: -1, time: 0),
    Coordinate(x: 0, y: 1, time: 0),
    Coordinate(x: -1, y: 0, time: 0),
    Coordinate(x: 1, y: -0, time: 0)
]

func bfs(start: Coordinate, goal: Coordinate){
    var queue = Queue<Coordinate>()
    queue.enqueue(element: start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y, time: now.time + 1)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            if graph[next.y][next.x] == 0 {
                continue
            }
            if next.x == goal.x && next.y == goal.y {
                print(next.time)
            }
            
            queue.enqueue(element: next)
            graph[next.y][next.x] = 0
        }
    }
}

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.map{ Int(String($0))! }
}

bfs(start: Coordinate(x: 0, y: 0, time: 1), goal: Coordinate(x: M - 1, y: N - 1, time: 0))

