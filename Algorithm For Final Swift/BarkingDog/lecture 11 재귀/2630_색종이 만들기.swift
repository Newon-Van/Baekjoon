//
//  2630_색종이 만들기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

func check(_ row: Int, _ col: Int, _ size: Int) -> Bool {
    let standard = board[row][col]
    
    for i in row ..< row + size {
        for j in col ..< col + size {
            if standard != board[i][j] { return false }
        }
    }
    
    return true
}

func divide(_ row: Int, _ col: Int, _ n: Int) {
    if check(row, col, n) {
        switch board[row][col] {
        case 0: whiteCounter += 1
        case 1: blueCounter += 1
        default: break
        }
    } else {
        let size = n / 2
        
        for i in 0 ..< 2 {
            for j in 0 ..< 2 {
                divide(row + (size * i), col + (size * j), size)
            }
        }
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()

var whiteCounter = 0
var blueCounter = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

divide(0, 0, n)
print("\(whiteCounter)\n\(blueCounter)")
