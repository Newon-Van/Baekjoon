//
//  12100_2048(Easy).swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/23.
//

import Foundation

enum Direction: CaseIterable {
    case up, down, left, right
}

struct Coordinate {
    var y: Int
    var x: Int
}

func conquer(direct: Direction, start: Coordinate) {
    switch direct {
    case .left:
        let now = start.x
        var next = now + 1
        
        guard next < board.count else { return }
        while next < board.count - 1 && board[start.y][next] == 0 {
            next += 1
        }
        
        if board[start.y][now] == 0 && board[start.y][next] != 0 {
            (board[start.y][now], board[start.y][next]) = (board[start.y][next], board[start.y][now])
            conquer(direct: .left, start: start)
        } else if board[start.y][now + 1] == 0 && board[start.y][next] != 0 {
            (board[start.y][now + 1], board[start.y][next]) = (board[start.y][next], board[start.y][now + 1])
        }
        
        if board[start.y][now] == board[start.y][now + 1] {
            board[start.y][now] *= 2
            board[start.y][now + 1] = 0
            result = max(result, board[start.y][now])
        }
        
        

    case .right:
        let now = start.x
        var next = now - 1
        
        guard 0 <= next else { return }
        while 0 < next && board[start.y][next] == 0 {
            next -= 1
        }
        
        if board[start.y][now] == 0 && board[start.y][next] != 0 {
            (board[start.y][now], board[start.y][next]) = (board[start.y][next], board[start.y][now])
            conquer(direct: .right, start: start)
        } else if board[start.y][now - 1] == 0 && board[start.y][next] != 0 {
            (board[start.y][now - 1], board[start.y][next]) = (board[start.y][next], board[start.y][now - 1])
        }
        
        if board[start.y][now] == board[start.y][now - 1] {
            board[start.y][now] *= 2
            board[start.y][now - 1] = 0
            result = max(result, board[start.y][now])
        }
        
        
    case .up:
        let now = start.y
        var next = now + 1
        
        guard next < board.count else { return }
        while next < board.count - 1 && board[next][start.x] == 0 {
            next += 1
        }
        
        if board[now][start.x] == 0 && board[next][start.x] != 0 {
            (board[now][start.x], board[next][start.x]) = (board[next][start.x], board[now][start.x])
            conquer(direct: .up, start: start)
        } else if board[now + 1][start.x] == 0 && board[next][start.x] != 0 {
            (board[now + 1][start.x], board[next][start.x]) = (board[next][start.x], board[now + 1][start.x])
        }
        
        if board[now][start.x] == board[now + 1][start.x] {
            board[now][start.x] *= 2
            board[now + 1][start.x] = 0
            result = max(result, board[now][start.x])
        }
        
        
    case .down:
        let now = start.y
        var next = now - 1
        
        guard 0 <= next else { return }
        while 0 < next && board[next][start.x] == 0 {
            next -= 1
        }
        
        if board[now][start.x] == 0 && board[next][start.x] != 0 {
            (board[now][start.x], board[next][start.x]) = (board[next][start.x], board[now][start.x])
            conquer(direct: .down, start: start)
        } else if board[now - 1][start.x] == 0 && board[next][start.x] != 0 {
            (board[now - 1][start.x], board[next][start.x]) = (board[next][start.x], board[now - 1][start.x])
        }
        
        if board[now][start.x] == board[now - 1][start.x] {
            board[now][start.x] *= 2
            board[now - 1][start.x] = 0
            result = max(result, board[now][start.x])
        }
        
        
    }
}


func go(depth: Int) {
    if depth == 0 { return }
    
    for direct in Direction.allCases {
        let originBoard = board
        
        
        switch direct {
        case .left:
            for i in 0 ..< board.count {
                for j in 0 ..< board.count {
                    conquer(direct: direct, start: Coordinate(y: i, x: j))
                }
            }
            
            
            
        case .right:
            for i in 0 ..< board.count {
                for j in stride(from: board.count - 1, to: -1, by: -1) {
                    conquer(direct: direct, start: Coordinate(y: i, x: j))
                }
            }
            
        case .up:
            for j in 0 ..< board.count {
                for i in 0 ..< board.count {
                    conquer(direct: direct, start: Coordinate(y: i, x: j))
                }
            }
            
        case .down:
            for j in 0 ..< board.count {
                for i in stride(from: board.count - 1, to: -1, by: -1) {
                    conquer(direct: direct, start: Coordinate(y: i, x: j))
                }
            }
            
        }
        
        go(depth: depth - 1)
        board = originBoard
    }
}


let N = Int(readLine()!)!
var board = [[Int]]()
var result = 0

for _ in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.map {
        let value = Int(String($0))!
        result = max(result, value)
        return value
    })
}

go(depth: 5)
print(result)
