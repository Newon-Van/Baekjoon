//
//  14499_주사위 굴리기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/06.
//

import Foundation

struct Coordination {
    var y: Int
    var x: Int
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M, y, x, K) = (input[0], input[1], input[2], input[3], input[4])

var board = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
for i in 0 ..< N {
    board[i] = readLine()!.split { $0 == " " }.map { Int($0)! }
}
var currentDice = Coordination(y: y, x: x)
var dice = [0, 0, 0, 0, 0, 0]


readLine()!.split { $0 == " " }.map {
    let value = Int($0)!
    
    switch value {
    case 1:
        guard currentDice.x + 1 < M else { break }
        currentDice.x += 1
        
        (dice[3], dice[0], dice[2], dice[5]) = (dice[5], dice[3], dice[0], dice[2])
        
        if board[currentDice.y][currentDice.x] == 0 {
            board[currentDice.y][currentDice.x] = dice[5]
        } else {
            dice[5] = board[currentDice.y][currentDice.x]
            board[currentDice.y][currentDice.x] = 0
        }
        
        print(dice[0])
        
    case 2:
        guard 0 <= currentDice.x - 1 else { break }
        currentDice.x -= 1
        
        (dice[3], dice[0], dice[2], dice[5]) = (dice[0], dice[2], dice[5], dice[3])
        
        if board[currentDice.y][currentDice.x] == 0 {
            board[currentDice.y][currentDice.x] = dice[5]
        } else {
            dice[5] = board[currentDice.y][currentDice.x]
            board[currentDice.y][currentDice.x] = 0
        }
        
        print(dice[0])
        
    case 3:
        guard 0 <= currentDice.y - 1 else { break }
        currentDice.y -= 1
        
        (dice[0], dice[1], dice[4], dice[5]) = (dice[4], dice[0], dice[5], dice[1])
        
        if board[currentDice.y][currentDice.x] == 0 {
            board[currentDice.y][currentDice.x] = dice[5]
        } else {
            dice[5] = board[currentDice.y][currentDice.x]
            board[currentDice.y][currentDice.x] = 0
        }
        
        print(dice[0])
        
    case 4:
        guard currentDice.y + 1 < N else { break }
        currentDice.y += 1
        
        (dice[0], dice[1], dice[4], dice[5]) = (dice[1], dice[5], dice[0], dice[4])
        
        if board[currentDice.y][currentDice.x] == 0 {
            board[currentDice.y][currentDice.x] = dice[5]
        } else {
            dice[5] = board[currentDice.y][currentDice.x]
            board[currentDice.y][currentDice.x] = 0
        }
        
        print(dice[0])
        
    default: break
    }
}






/*
   2
 4 1 3
   5
   6
 */
