//
//  2206_벽 부수고 이동하기.swift
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
    var breakWallActive: Bool = true
}

struct Visited: Equatable {
    var value: Bool
    var breakValue: Bool
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func bfs() {
    var queue = Queue<Coordinate>()
    queue.enqueue(Coordinate(y: 0, x: 0, time: 1))
    board[0][0] = 2
    
    if board.count == 1 && board.first!.count == 1 { print(1); return }
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            var next = Coordinate(y: now.y + direct.y, x: now.x + direct.x, time: now.time + 1, breakWallActive: now.breakWallActive)
            
            guard 0 ..< input[0] ~= next.y && 0 ..< input[1] ~= next.x else { continue }
            if next.y == board.count - 1 && next.x == board.first!.count - 1{
                print(next.time)
                return
            }
            
            switch board[next.y][next.x] {
            case 0:
                next.breakWallActive ? { board[next.y][next.x] = 2 }() : { board[next.y][next.x] = 3 }()
            case 1:
                if !next.breakWallActive { continue }
                next.breakWallActive = false
                board[next.y][next.x] = 4
            case 2:
                if next.breakWallActive { continue }
                board[next.y][next.x] = 4
            case 3:
                if !next.breakWallActive { continue }
                board[next.y][next.x] = 4
            default: continue
            }
            
            queue.enqueue(next)
        }
    }
    
    print(-1)
}

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var board = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])

for i in 0 ..< input[0] {
    board[i] = readLine()!.map { Int(String($0))! }
}

bfs()
