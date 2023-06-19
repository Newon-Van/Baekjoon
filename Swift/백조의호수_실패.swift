//
//  백조의호수_실패.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/04.
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

func bfs(move: inout [Coordinate]?, from swan: Coordinate) -> Bool {
    guard let start = move?.first else { return false }
    move?.removeAll()
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    visited[start.y][start.x] = true
    
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= C || next.y < 0 || next.y >= R {
                continue
            }
            
            if visited[next.y][next.x] {
                continue
            }
            
            if graph[next.y][next.x] == "X" {
                visited[next.y][next.x] = true
                graph[next.y][next.x] = "."
                
                if move?.isEmpty == true {
                    move?.append(next)
                }
                
                continue
            }
            
            if next.y == swan.y && next.x == swan.x {
                
                if swan.y == swanOne!.y && swan.x == swanOne!.x {
                    result += 1
                }
                
                return false
            }
            
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    
    return true
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C) = (input[0], input[1])
var graph = [[String]](repeating: [String](repeating: "", count: input[1]), count: input[0])

var swanOne: Coordinate?
var swanTwo: Coordinate?

var moveOne: [Coordinate]? = []
var moveTwo: [Coordinate]? = []
var result = 0

for i in 0 ..< R {
    graph[i] = readLine()!.map { String($0) }
    
    if swanOne == nil {
        for j in 0 ..< C {
            if graph[i][j] == "L" {
                swanOne = Coordinate(x: j, y: i)
                moveOne?.append(Coordinate(x: j, y: i))
            }
        }
    } else if swanTwo == nil {
        for j in 0 ..< C {
            if graph[i][j] == "L" {
                swanTwo = Coordinate(x: j, y: i)
                moveTwo?.append(Coordinate(x: j, y: i))
            }
        }
    }
}

while true {
    let leftMove = bfs(move: &moveOne, from: swanTwo!)
    if !leftMove { break }
    
    let rightMove = bfs(move: &moveTwo, from: swanOne!)
    if !rightMove { break }
    
    result += 1
    
}

print(result)
