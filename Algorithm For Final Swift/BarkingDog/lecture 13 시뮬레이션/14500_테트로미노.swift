//
//  14500_테트로미노.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/16.
//

import Foundation

enum Degree: CaseIterable {
    case _90
    case _180
    case _270
}

enum Tetromino {
    case fill
    case empty
}

struct Coordinate {
    var y: Int
    var x: Int
}


func setupTetro() {
    tetromino.insert([[Tetromino]](repeating: [Tetromino](repeating: .fill, count: 4), count: 1))
    tetromino.insert([[Tetromino]](repeating: [Tetromino](repeating: .fill, count: 2), count: 2))
    var raw1 = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: 2), count: 3)
    raw1[0][1] = .empty
    raw1[1][1] = .empty
    tetromino.insert(raw1)
    
    var raw2 = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: 2), count: 3)
    raw2[0][1] = .empty
    raw2[2][0] = .empty
    tetromino.insert(raw2)
    
    var raw3 = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: 3), count: 2)
    raw3[1][0] = .empty
    raw3[1][2] = .empty
    tetromino.insert(raw3)
}

func reverse(raw: [[Tetromino]]) -> [[Tetromino]] {
    var newTetromino = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: raw.first!.count), count: raw.count)

    for i in 0 ..< newTetromino.count {
        for j in 0 ..< newTetromino.first!.count {
            newTetromino[i][j] = raw[i][raw.first!.count - 1 - j]
        }
    }
    
    return newTetromino
}

func rotate(raw: [[Tetromino]], degree: Degree) -> [[Tetromino]] {
    
    switch degree {
    case ._90:
        var newTetromino = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: raw.count), count: raw.first!.count)
        
        for i in 0 ..< newTetromino.count {
            for j in 0 ..< newTetromino.first!.count {
                newTetromino[i][j] = raw[raw.count - j - 1][i]
            }
        }
        
        return newTetromino
        
    case ._180:
        var newTetromino = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: raw.first!.count), count: raw.count)
        
        for i in 0 ..< newTetromino.count {
            for j in 0 ..< newTetromino.first!.count {
                newTetromino[i][j] = raw[raw.count - 1 - i][raw.first!.count - 1 - j]
            }
        }
        
        return newTetromino
        
    case ._270:
        var newTetromino = [[Tetromino]](repeating: [Tetromino](repeating: .fill, count: raw.count), count: raw.first!.count)
        
        for i in 0 ..< newTetromino.count {
            for j in 0 ..< newTetromino.first!.count {
                newTetromino[i][j] = raw[j][raw.first!.count - 1 - i]
            }
        }
        
        return newTetromino
        
    }
}

func attach(tetromino: [[Tetromino]], startI: Int, startJ: Int) -> Int {
    var value = 0
    
    guard startI + tetromino.count <= N && startJ + tetromino.first!.count <= M else { return 0 }
    
    for i in 0 + startI ..< tetromino.count + startI {
        for j in 0 + startJ ..< tetromino.first!.count + startJ {
            tetromino[i - startI][j - startJ] == .fill ? { value += board[i][j] }() : {}()
        }
    }
    
    return value
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
var board = [[Int]]()
var tetromino = Set<[[Tetromino]]>()
var result = 0

for _ in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

setupTetro()

tetromino.forEach { tetro in
    tetromino.insert(reverse(raw: tetro))
    Degree.allCases.forEach { degree in
        let rotatedTetro = rotate(raw: tetro, degree: degree)
        let reversedTetro = reverse(raw: rotatedTetro)
        
        tetromino.insert(rotatedTetro)
        tetromino.insert(reversedTetro)
    }
}


for i in 0 ..< N {
    for j in 0 ..< M {
        tetromino.forEach { tetro in
            result = max(attach(tetromino: tetro, startI: i, startJ: j), result)
        }
    }
}

print(result)

