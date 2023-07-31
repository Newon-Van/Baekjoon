//
//  7562_나이트의 이동.swift
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

struct Coordinate: Equatable {
    var y: Int
    var x: Int
    var time: Int = 0
}

let directions = [
    Coordinate(y: -2, x: -1),
    Coordinate(y: -1, x: -2),
    Coordinate(y: 1, x: -2),
    Coordinate(y: 2, x: -1),
    Coordinate(y: -2, x: 1),
    Coordinate(y: -1, x: 2),
    Coordinate(y: 1, x: 2),
    Coordinate(y: 2, x: 1)
]

func bfs(n:Int, board: inout [[Int]], start: Coordinate, target: Coordinate) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: direct.y + now.y, x: direct.x + now.x, time: now.time + 1)
            
            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] == 0 else { continue }
            
            if target.y == next.y && target.x == next.x { print(next.time); return }
            
            board[next.y][next.x] = 1
            queue.enqueue(next)
        }
    }
}

var testCase = Int(readLine()!)!

while testCase > 0 {
    
    let n = Int(readLine()!)!
    
    var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let start = Coordinate(y: input[0], x: input[1])
    input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let target = Coordinate(y: input[0], x: input[1])
    
    if target == start {
        print(0)
    } else {
        bfs(n: n, board: &board, start: start, target: target)
    }
    
    
    testCase -= 1
}
