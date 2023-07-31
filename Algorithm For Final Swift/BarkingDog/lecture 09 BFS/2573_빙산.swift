//
//  2573_빙산.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
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

struct Coordinate: Equatable, Hashable {
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func checking(start: Coordinate) {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: board.first!.count), count: board.count)
    queue.enqueue(start)
    checkingBergs.remove(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        checkingBergs.remove(now)
        
        for direct in directions {
            let next = Coordinate(y: direct.y + now.y, x: direct.x + now.x)
            
            guard 0 ..< board.count ~= next.y && 0 ..< board.first!.count ~= next.x else { continue }
            guard board[next.y][next.x] > 0 else { continue }
            guard !visited[next.y][next.x] else { continue }
            
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    
}

func meltingIce(checkBoard: [[Int]]) {
    var queue = Queue<Coordinate>()
    while !icebergs.isEmpty {
        queue.enqueue(icebergs.removeFirst())
    }
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        guard board[now.y][now.x] > 0 else { continue }
        
        for direct in directions {
            let next = Coordinate(y: direct.y + now.y, x: direct.x + now.x)
            
            guard 0 ..< board.count ~= next.y && 0 ..< board.first!.count ~= next.x else { continue }
            guard board[now.y][now.x] > 0 else { continue }
            guard checkBoard[next.y][next.x] == 0 else { icebergs.insert(now); continue }
            
            board[now.y][now.x] -= 1
            if board[now.y][now.x] > 0 { icebergs.insert(now) } else { icebergs.remove(now) }
        }
    }
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
var board = [[Int]]()
var icebergs = Set<Coordinate>()
var checkingBergs = Set<Coordinate>()

var separate = 0
var result = 0

for i in 0 ..< input[0] {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    
    for j in 0 ..< board[i].count {
        if board[i][j] > 0 {
            icebergs.insert(Coordinate(y: i, x: j))
        }
    }
}

while separate < 2 && !icebergs.isEmpty {
    result += 1
    separate = 0
    meltingIce(checkBoard: board)
    checkingBergs = icebergs
    
    while !checkingBergs.isEmpty {
        checking(start: checkingBergs.removeFirst())
        separate += 1
    }

    checkingBergs.removeAll()
}

print(icebergs.isEmpty ? 0 : result)

/*
10 10
0 0 0 0 0 0 0 0 0 0
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 9 9 9 9 1 9 9 9 9
0 0 0 0 0 0 0 0 0 0
 */
