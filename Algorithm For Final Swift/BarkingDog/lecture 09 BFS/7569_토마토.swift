//
//  7569_토마토.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/11.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ value: T) {
        input.append(value)
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
    var y: Int
    var x: Int
    var z: Int
    var time: Int = 0
}

let directions = [
    Coordinate(y: -1, x: 0, z: 0),
    Coordinate(y: 1, x: 0, z: 0),
    Coordinate(y: 0, x: -1, z: 0),
    Coordinate(y: 0, x: 1, z: 0),
    Coordinate(y: 0, x: 0, z: -1),
    Coordinate(y: 0, x: 0, z: 1)
]

func bfs() {
    var queue = Queue<Coordinate>()
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: input[0]), count: input[1]), count: input[2])
    var result = 0
    startLocation.forEach {
        queue.enqueue($0)
    }
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x, z: now.z + direct.z, time: now.time + 1)
            
            guard 0 ..< input[0] ~= next.x && 0 ..< input[1] ~= next.y && 0 ..< input[2] ~= next.z else { continue }
            guard board[next.z][next.y][next.x] == 0 else { continue }
            guard !visited[next.z][next.y][next.x] else { continue }
            
            tomato -= 1
            visited[next.z][next.y][next.x] = true
            result = max(next.time, result)
            queue.enqueue(next)
        }
    }
    
    tomato == 0 ? print(result) : print(-1)
}

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var board = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: input[0]), count: input[1]), count: input[2])
var startLocation = [Coordinate]()
var tomato = 0


for height in 0 ..< input[2] {
    for i in 0 ..< input[1] {
        board[height][i] = readLine()!.split { $0 == " " }.map { Int(String($0))! }
        
        for j in 0 ..< input[0] {
            if board[height][i][j] == 1 { startLocation.append(Coordinate(y: i, x: j, z: height)) }
            if board[height][i][j] == 0 { tomato += 1 }
        }
    }
}

bfs()
