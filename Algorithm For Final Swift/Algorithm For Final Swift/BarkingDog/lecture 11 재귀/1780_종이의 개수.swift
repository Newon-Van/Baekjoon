//
//  1780_종이의 개수.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

func check(_ n: Int, _ row: Int, _ col: Int) -> Bool {
    let standard = board[row][col]
    
    for i in row ..< row + n {
        for j in col ..< col + n {
            if board[i][j] != standard { return false }
        }
    }
    
    return true
}

func divide(n: Int, row: Int, col: Int) {
    if check(n, row, col) {
        switch board[row][col] {
        case -1: minusCount += 1
        case 0: zeroCount += 1
        case 1: plusCount += 1
        default: break
        }
    } else {
        let size = n / 3
        
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                divide(n: size, row: row + (size * i), col: col + (size * j))
            }
        }
    }
}

let n = Int(readLine()!)!

var minusCount = 0
var zeroCount = 0
var plusCount = 0

var board = [[Int]]()
for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

divide(n: n, row: 0, col: 0)
print("\(minusCount)\n\(zeroCount)\n\(plusCount)")
