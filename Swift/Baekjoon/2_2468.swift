//
//  2_2468.swift
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
    
    var count : Int {
        return input.count + output.count
    }
    
    var peek : T? {
        if output.isEmpty {
            return input.first
        } else {
            return output.last
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
    var x = 0
    var y = 0
}



let directions = [
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1),
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0),
]

func solve(graph: inout [[Int]],start: Coordinate, depth: Int){
    var queue = Queue<Coordinate>()
    queue.enqueue(element: start)
    graph[start.y][start.x] = -1
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direction in directions {
            let next = Coordinate(x: now.x + direction.x, y: now.y + direction.y)
            
            if next.x < 0 || next.x >= N || next.y < 0 || next.y >= N {
                continue
            }
            if graph[next.y][next.x] == -1 || graph[next.y][next.x] <= depth {
                continue
            }
            
            queue.enqueue(element: next)
            graph[next.y][next.x] = -1
        }
    }
}


let N = Int(readLine()!)!
var minimum = 100

var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    minimum = min(minimum, graph[i].min()!)
}

let graphOrigin = graph

var result = 1

for depth in minimum ... 100 {
    var temp = 0
    graph = graphOrigin
    
    for i in 0 ..< N {
        for j in 0 ..< N {
            if  graph[i][j] != -1 && graph[i][j] > depth {
                solve(graph: &graph, start: Coordinate(x: j, y: i), depth: depth)
                temp += 1
            }
        }
    }
    
    result = max(result, temp)
}

print(result)
