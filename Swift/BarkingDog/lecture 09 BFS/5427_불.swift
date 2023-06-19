//
//  5427_불.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/12.
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

struct Coordinate: Equatable {
    var y: Int
    var x: Int
    var time: Int = 0
}

struct Board {
    var value: String
    var fireTime: Int = 0
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func fireBFS(board: inout [[Board]], start: [Coordinate]) {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: board.first!.count), count: board.count)
    start.forEach {
        queue.enqueue($0)
        visited[$0.y][$0.x] = true
    }
    
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: direct.y + now.y, x: direct.x + now.x, time: now.time + 1)
            
            guard 0 ..< board.count ~= next.y && 0 ..< board.first!.count ~= next.x else { continue }
            guard !visited[next.y][next.x] else { continue }
            guard board[next.y][next.x].value == "." || board[next.y][next.x].value == "@" else { continue }
            
            board[next.y][next.x].fireTime = next.time
            visited[next.y][next.x] = true
            queue.enqueue(next)
        }
    }
}

func moveBFS(board: [[Board]], start: Coordinate) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: board.first!.count), count: board.count)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x, time: now.time + 1)
            
            guard 0 ..< board.first!.count ~= next.x && 0 ..< board.count ~= next.y else {
                print(next.time)
                return
            }
            guard board[next.y][next.x].value == "." && (board[next.y][next.x].fireTime > next.time || board[next.y][next.x].fireTime == 0) else { continue }
            guard !visited[next.y][next.x] else { continue }
            
            visited[next.y][next.x] = true
            queue.enqueue(next)
        }
    }
    print("IMPOSSIBLE")
}

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var board = [[Board]](repeating: [Board](repeating: Board(value: ""), count: input[0]), count: input[1])
    
    var start = Coordinate(y: 0, x: 0)
    var fireLocation = [Coordinate]()

    for i in 0 ..< input[1] {
        board[i] = readLine()!.enumerated().map { j, value in
            if String(value) == "@" {
                start = Coordinate(y: i, x: j)
            }
            if String(value) == "*" {
                fireLocation.append(Coordinate(y: i, x: j))
            }
            return Board(value: String(value))
        }
    }
    
    fireBFS(board: &board, start: fireLocation)
    moveBFS(board: board, start: start)
    
    testCase -= 1
}

