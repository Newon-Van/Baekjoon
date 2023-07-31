//
//  [카카오 인턴] 경주로 건설.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/16.
//

import Foundation

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    var count: Int {
        input.count + output.count
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

enum LastDirect {
    case left, right, top, bottom, nope
}

struct Coordinate {
    var x: Int
    var y: Int
    var from: LastDirect = .nope
    var cost: Int
}

let directions = [
    Coordinate(x: -1, y: 0, from: .left, cost: 0),
    Coordinate(x: 1, y: 0, from: .right, cost: 0),
    Coordinate(x: 0, y: -1, from: .top, cost: 0),
    Coordinate(x: 0, y: 1, from: .bottom, cost: 0)
]

func bfs(_ board:[[Int]]) -> Int {
    let N = board.count
    var queue = Queue<Coordinate>()
    queue.enqueue(Coordinate(x: 0, y: 0, from: .nope, cost: 0))
    
    var costBoard = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: 4), count: N), count: N)
    
    var result = Int.max
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for i in directions.indices {
            var next = Coordinate(
                x: directions[i].x + now.x,
                y: directions[i].y + now.y,
                from: directions[i].from,
                cost: now.cost
            )
            
            if next.x < 0 || next.x >= N || next.y < 0 || next.y >= N {
                continue
            }
            
            if now.from == .nope {
              next.cost += 100
            } else if now.from == directions[i].from {
                next.cost += 100
            } else {
                next.cost += 600
            }
            
            if board[next.y][next.x] == 1 {
                continue
            }
            
            if costBoard[next.y][next.x][i] < next.cost {
                continue
            }
            
            if next.y == N - 1 && next.x == N - 1 {
                result = min(result, next.cost)
                continue
            }
            
            costBoard[next.y][next.x][i] = next.cost
            queue.enqueue(next)
        }
    }
    
    return result
}


func solution(_ board:[[Int]]) -> Int {
    return bfs(board)
}

print(solution([[0,0,0],[0,0,0],[0,0,0]]))
