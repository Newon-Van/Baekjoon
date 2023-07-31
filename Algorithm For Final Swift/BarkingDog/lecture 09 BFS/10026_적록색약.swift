//
//  10026_적록색약.swift
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
    var y: Int
    var x: Int
}

struct Visited {
    var caseOne: Bool
    var caseTwo: Bool
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func bfs(start: Coordinate, isCaseTwo: Bool = false) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(y: direct.y + now.y, x: direct.x + now.x)
            
            guard 0 ..< n ~= next.x && 0 ..< n ~= next.y else { continue }
            
            switch isCaseTwo {
            case true:
                if visited[next.y][next.x].caseTwo { continue }
                if board[start.y][start.x] == "B" && board[next.y][next.x] != "B" { continue }
                if board[start.y][start.x] != "B" && board[next.y][next.x] == "B" { continue }
            case false:
                if visited[next.y][next.x].caseOne { continue }
                if board[start.y][start.x] != board[next.y][next.x] { continue }
            }
            
            queue.enqueue(next)
            isCaseTwo ? { visited[next.y][next.x].caseTwo = true }() : { visited[next.y][next.x].caseOne = true }()
        }
    }
}

let n = Int(readLine()!)!
var board = [[String]](repeating: [String](repeating: "", count: n), count: n)
var visited = [[Visited]](repeating: [Visited](repeating: Visited(caseOne: false, caseTwo: false), count: n), count: n)
var caseOne = 0
var caseTwo = 0

for i in 0 ..< n {
    let input = Array(readLine()!).map { String($0) }
    board[i] = input
}


for i in 0 ..< n {
    for j in 0 ..< n {
        if !visited[i][j].caseOne {
            bfs(start: Coordinate(y: i, x: j))
            caseOne += 1
        }
        if !visited[i][j].caseTwo {
            bfs(start: Coordinate(y: i, x: j), isCaseTwo: true)
            caseTwo += 1
        }
    }
}

print(caseOne, caseTwo)
