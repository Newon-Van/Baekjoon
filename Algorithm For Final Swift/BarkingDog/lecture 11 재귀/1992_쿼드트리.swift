//
//  1992_쿼드트리.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

func check(_ row: Int, _ col: Int, _ size: Int) -> Bool {
    let standard = board[row][col]
    
    for i in row ..< row + size {
        for j in col ..< col + size {
            if board[i][j] != standard { return false }
        }
    }
    
    return true
}

func divide(_ row: Int, _ col: Int, _ size: Int) -> String {
    if check(row, col, size) {
        switch board[row][col] {
        case 0: return "0"
        case 1: return "1"
        default: break
        }
    }
    
    let newSize = size / 2
    var result = ""
    
    for i in 0 ..< 2 {
        for j in 0 ..< 2 {
            result += "\(divide(row + ( i * newSize), col + (j * newSize), newSize))"
        }
    }
    
    return "(\(result))"
}

let n = Int(readLine()!)!
var board = [[Int]]()

for _ in 0 ..< n {
    board.append(readLine()!.map { Int(String($0))! })
}

print(divide(0, 0, n))
