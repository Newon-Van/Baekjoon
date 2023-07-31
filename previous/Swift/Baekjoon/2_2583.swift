//
//  2_2583.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/16.
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
    
    mutating func peek() -> T? {
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
        return output.removeLast()
    }
}

struct Coordinate {
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1),
    Coordinate(x: 1, y: 0),
    Coordinate(x: -1, y: 0),
]


func drawSquare(start: Coordinate, end: Coordinate){
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

    queue.enqueue(element: start)
    graph[start.y][start.x] = 1
    visited[start.y][start.x] = true
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direction in directions {
            let next = Coordinate(x: now.x + direction.x, y: now.y + direction.y)
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            if next.x < start.x || next.y < start.y || next.x > end.x - 1 || next.y > end.y - 1 {
                continue
            }
            if visited[next.y][next.x] {
                continue
            }
            
            queue.enqueue(element: next)
            visited[next.y][next.x] = true
            graph[next.y][next.x] += 1
        }
    }
}

func solve(start: Coordinate) -> Int{
    var queue = Queue<Coordinate>()
    var territory = 0

    queue.enqueue(element: start)
    graph[start.y][start.x] = 1
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        territory += 1
        
        for direction in directions {
            let next = Coordinate(x: now.x + direction.x, y: now.y + direction.y)
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            if graph[next.y][next.x] != 0 {
                continue
            }
            
            queue.enqueue(element: next)
            graph[next.y][next.x] += 1
        }
    }
    
    return territory
}


let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let (N, M, K) = (input[0], input[1], input[2])
var result = 0
var resultArr = [Int]()

var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)


for _ in 1 ... K {
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    drawSquare(start: Coordinate(x: input[0], y: input[1]), end: Coordinate(x: input[2], y: input[3]))
}

graph = graph.reversed()


for i in 0 ..< N {
    for j in 0 ..< M {
        if graph[i][j] == 0 {
            resultArr.append(solve(start: Coordinate(x: j, y : i)))
            result += 1
        }
    }
}

print(result)
resultArr.sorted().forEach{
    print($0, terminator: " ")
}
