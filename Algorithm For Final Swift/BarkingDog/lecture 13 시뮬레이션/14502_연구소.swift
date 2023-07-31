//
//  14502_연구소.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/20.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
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
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func spread() -> Int {
    var queue = Queue<Coordinate>()
    var newBoard = board
    virusList.forEach { queue.enqueue($0) }
    var result = N * M - initValue
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x)
            
            guard 0 ..< N ~= next.y && 0 ..< M ~= next.x else { continue }
            guard newBoard[next.y][next.x] == 0 else { continue }
            
            newBoard[next.y][next.x] = 2
            queue.enqueue(next)
            result -= 1
        }
    }
    
    return result
}

func constructWall(depth: Int, n: Int) {
    if depth == 3 {
        result = max(spread(), result)
        return
    }
    
    for i in n ..< N {
        for j in 0 ..< M {
            guard board[i][j] == 0 else { continue }
            board[i][j] = 1
            constructWall(depth: depth + 1, n: i)
            board[i][j] = 0
        }
    }
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
var board = [[Int]]()
var virusList = [Coordinate]()
var initValue = 3
var result = 0

for i in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.enumerated().map { j, raw in
        let value = Int(raw)!
        
        if value == 2 {
            virusList.append(Coordinate(y: i, x: j))
        }
        value != 0 ? { initValue += 1 }() : {}()
        
        return value
    })
}

constructWall(depth: 0, n: 0)
print(result)


