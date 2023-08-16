//
//  16985_Maaaaaaaaaze.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/03.
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
    var z: Int
    var y: Int
    var x: Int
    var time: Int = 0
}

let directions = [
    Coordinate(z: -1, y: 0, x: 0),
    Coordinate(z: 1, y: 0, x: 0),
    Coordinate(z: 0, y: -1, x: 0),
    Coordinate(z: 0, y: 1, x: 0),
    Coordinate(z: 0, y: 0, x: -1),
    Coordinate(z: 0, y: 0, x: 1)
]

let vertexList = [
    [Coordinate(z: 0, y: 0, x: 0), Coordinate(z: 4, y: 4, x: 4)],
    [Coordinate(z: 0, y: 0, x: 4), Coordinate(z: 4, y: 4, x: 0)],
    [Coordinate(z: 0, y: 4, x: 0), Coordinate(z: 4, y: 0, x: 4)],
    [Coordinate(z: 0, y: 4, x: 4), Coordinate(z: 4, y: 0, x: 0)]
]

enum Degree: CaseIterable {
    case _0
    case _90
    case _180
    case _270
}

func combination(depth: Int) {
    if depth == 5 {
        mazeList.insert(mazeMakerTrace)
        return
    }
    
    
    for i in 0 ..< inputBoard.count {
        guard !mazeMakerVisited[i] else { continue }
        
        Degree.allCases.forEach {
            mazeMakerTrace.append(rotate(board: inputBoard[i], degree: $0))
            mazeMakerVisited[i] = true
            
            combination(depth: depth + 1)
            
            mazeMakerVisited[i] = false
            mazeMakerTrace.removeLast()
        }
    }
}

func rotate(board: [[Int]], degree: Degree) -> [[Int]] {
    var newBoard = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)
    
    switch degree {
    case ._0:
        return board
    case ._90:
        
        for i in 0 ..< 5 {
            for j in 0 ..< 5 {
                newBoard[i][j] = board[4 - j][i]
            }
        }
        return newBoard
        
    case ._180:
        
        for i in 0 ..< 5 {
            for j in 0 ..< 5 {
                newBoard[i][j] = board[4 - i][4 - j]
            }
        }
        return newBoard
        
    case ._270:
        
        for i in 0 ..< 5 {
            for j in 0 ..< 5{
                newBoard[i][j] = board[j][4 - i]
            }
        }
        return newBoard
        
    }
}


func find(maze: [[[Int]]], start: Coordinate, goal: Coordinate) {
    guard maze[start.z][start.y][start.x] == 1 && maze[goal.z][goal.y][goal.x] == 1 else { return }
    
    var queue = Queue<Coordinate>()
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5), count: 5)
    
    queue.enqueue(start)
    visited[start.z][start.y][start.x] = false
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(z: now.z + direct.z, y: now.y + direct.y, x: now.x + direct.x, time: now.time + 1)
            
            guard 0 ..< 5 ~= next.z && 0 ..< 5 ~= next.y && 0 ..< 5 ~= next.x else { continue }
            guard !visited[next.z][next.y][next.x] else { continue }
            guard maze[next.z][next.y][next.x] == 1 else { continue }
            guard next.time <= result else { continue }
            
            if next.z == goal.z && next.y == goal.y && next.x == goal.x {
                result = min(result, next.time)
                return
            }
            
            queue.enqueue(next)
            visited[next.z][next.y][next.x] = true
        }
    }
}

var inputBoard = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5), count: 5)
var mazeList = Set<[[[Int]]]>()

for i in 0 ..< 25 {
    inputBoard[i / 5][i % 5] = readLine()!.split { $0 == " " }.map { Int($0)! }
}

var mazeMakerTrace = [[[Int]]]()
var mazeMakerVisited = [Bool](repeating: false, count: 5)

combination(depth: 0)

var result = Int.max

mazeList.forEach { maze in
    vertexList.forEach { vertex in
        find(maze: maze, start: vertex[0], goal: vertex[1])
    }
}

print(result == Int.max ? -1 : result)
