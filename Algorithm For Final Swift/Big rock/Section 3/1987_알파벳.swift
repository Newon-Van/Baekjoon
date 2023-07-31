//
//  1987_알파벳.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/05.
//

struct Coordinate {
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0),
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1)
]

func backTracking(depth: Int, now: Coordinate, bit: Int) {
    result = result > depth ? result : depth
    
    for direct in directions {
        let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
        
        if next.x < 0 || next.x >= C || next.y < 0 || next.y >= R {
            continue
        }
        
        let alphabet = 1 << graph[next.y][next.x]
        if bit & alphabet == 0 {
            backTracking(depth: depth + 1, now: next, bit: bit | alphabet)
        }
    }
}

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (input[0], input[1])
var graph = [[Int]]()
var result = 1

(0 ..< R).forEach { _ in
    let row = readLine()!.map { Int(Character(String($0)).asciiValue! - Character("A").asciiValue!) }
    graph.append(row)
}

backTracking(depth: 1, now: Coordinate(x: 0, y: 0), bit: 1 << graph[0][0])
print(result)
