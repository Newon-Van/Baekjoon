//
//  1012_유기농 배추.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
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
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1),
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0)
]

func bfs(board: inout [[Int]], start: Coordinate) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            guard 0 ..< board.count ~= next.y && 0 ..< board.first!.count ~= next.x else { continue }
            guard board[next.y][next.x] == 1 else { continue }
            
            board[next.y][next.x] = 0
            queue.enqueue(next)
        }
    }
}

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    var board = [[Int]](repeating: [Int](repeating: 0, count: input[0]), count: input[1])
    var result = 0
    
    for _ in 0 ..< input[2] {
        let cabbage = readLine()!.split { $0 == " " }.map { Int($0)! }
        board[cabbage[1]][cabbage[0]] = 1
    }
    
    for i in 0 ..< input[1] {
        for j in 0 ..< input[0] {
            if board[i][j] == 1 {
                result += 1
                bfs(board: &board, start: Coordinate(x: j, y: i))
            }
        }
    }
    
    print(result)
    
    testCase -= 1
}
