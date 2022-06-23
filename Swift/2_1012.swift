//
//  2_1012.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/15.
//

import Foundation

struct Queue<T> {
    var input: [T] = []
    var output: [T] = []
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var cout : Int {
        return input.count + output.count
    }
    
    func peek() -> T? {
        if output.isEmpty {
            return input.last
        } else {
            return output.first
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
        return output.removeFirst()
    }
}

struct Coordinate {
    var x = 0
    var y = 0
}

let directions = [
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1),
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0),
]

func solve(graph: inout [[Int]],start: Coordinate, N: Int, M: Int) {
    var queue = Queue<Coordinate>()
    queue.enqueue(element: start)
    graph[start.y][start.x] = 0
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direction in directions {
            let next = Coordinate(x: now.x + direction.x, y: now.y + direction.y)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            if graph[next.y][next.x] == 0 {
                continue
            }
            
            queue.enqueue(element: next)
            graph[next.y][next.x] = 0
        }
    }
}

var testCase = Int(readLine() ?? "") ?? 0

while testCase > 0 {
    testCase -= 1
    
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let M = input[0], N = input[1], K = input[2]
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for _ in 1 ... K {
        let lettuce = readLine()!.components(separatedBy: " ").map { Int($0)! }
        graph[lettuce[1]][lettuce[0]] = 1
    }
    
    var result = 0
    
    for i in 0 ..< N {
        for j in 0 ..< M {
            if graph[i][j] == 1 {
                solve(graph: &graph, start: Coordinate(x: j, y: i), N: N, M: M)
                result += 1
            }
        }
    }
    
    print(result)
}
