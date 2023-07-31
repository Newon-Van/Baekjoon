//
//  14503_로봇 청소기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/07.
//

import Foundation

struct Coordinate {
    var y: Int
    var x: Int
    var looking = 0
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: 1)
]

func clean() {
    board[robot.y][robot.x] = 2
    result += 1
}

func check() -> Bool {
    for i in robot.looking + 1 ..< directions.count + robot.looking + 1 {
        let next = Coordinate(y: robot.y + directions[i % 4].y, x: robot.x + directions[i % 4].x)
        
        guard 0 ..< N ~= next.y && 0 ..< M ~= next.x else { continue }
        
        if board[next.y][next.x] == 0 {
            robot = Coordinate(y: next.y, x: next.x, looking: i % 4)
            clean()
            return true
        }
    }
    
    switch robot.looking {
    case 0:
        guard board[robot.y + 1][robot.x] != 1 else { return false }
        robot.y += 1
    case 1:
        guard board[robot.y][robot.x + 1] != 1 else { return false }
        robot.x += 1
    case 2:
        guard board[robot.y - 1][robot.x] != 1 else { return false }
        robot.y -= 1
    case 3:
        guard board[robot.y][robot.x - 1] != 1 else { return false }
        robot.x -= 1
    default: return false
    }
    
    return true
}


var input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
var board = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

input = readLine()!.split { $0 == " " }.map { Int($0)! }
var robotLooking = 0

switch input[2] {
case 0: robotLooking = 0
case 1: robotLooking = 3
case 2: robotLooking = 2
case 3: robotLooking = 1
default: break
}

var robot = Coordinate(y: input[0], x: input[1], looking: robotLooking)
var result = 0

for i in 0 ..< N {
    board[i] = readLine()!.split { $0 == " " }.map { Int($0)! }
}

clean()
while check() {}

print(result)
