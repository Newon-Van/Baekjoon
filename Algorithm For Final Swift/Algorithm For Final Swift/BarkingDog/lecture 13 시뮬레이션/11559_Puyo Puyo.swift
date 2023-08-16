//
//  11559_Puyo Puyo.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/23.
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

struct Coordinate: Hashable {
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]



func pung(start: Coordinate) -> Bool {
    let symbol = board[start.y][start.x]
    guard symbol != "." else { return false }
    
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    var pungList = Set<Coordinate>()
    pungList.insert(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x)
                    
            guard 0 ..< 6 ~= next.x && 0 ..< 12 ~= next.y else { continue }
            guard board[next.y][next.x] == symbol else { continue }
            guard !pungList.contains(next) else { continue }
            
            queue.enqueue(next)
            pungList.insert(next)
        }
    }
    
    if pungList.count >= 4 {
        pungList.forEach {
            board[$0.y][$0.x] = "."
            puyos.remove($0)
        }
        return true
    }
    
    return false
}


func grab() {
    var newPuyos = Set<Coordinate>()
    for j in 0 ..< board.first!.count {
        for i in stride(from: board.count - 1, to: -1, by: -1) {
            
            if board[i][j] == "." {
                var next = i - 1
                guard 0 <= next else { continue }
                
                while 0 < next && board[next][j] == "." { next -= 1 }
                
                if board[next][j] != "." {
                    (board[i][j], board[next][j]) = (board[next][j], board[i][j])
                    newPuyos.insert(Coordinate(y: i, x: j))
                }
            } else {
                newPuyos.insert(Coordinate(y: i, x: j))
            }
        }
    }
    
    puyos = newPuyos
}

func check() {
    var isPung = false
    
    for puyo in puyos {
        isPung = pung(start: puyo) || isPung
    }
    
    if isPung {
        result += 1
        grab()
        check()
    }
}


var board = [[String]]()
var puyos = Set<Coordinate>()
var result = 0

for i in 0 ..< 12 {
    board.append(readLine()!.enumerated().map { j, element in
        let value = String(element)
        if value != "." { puyos.insert(Coordinate(y: i, x: j)) }
        return value
    })
}

check()
print(result)
