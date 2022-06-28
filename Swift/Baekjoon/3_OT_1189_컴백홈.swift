//
//  3_OT_1189.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/23.
//

import Foundation

struct Coordinate {
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1),
]


func findWay(depth: Int, now: Coordinate) -> Int {
    if depth == K {
        if now.y == 0 && now.x == C - 1 {
            return 1
        } else {
            return 0
        }
    }
    
    var count = 0
    
    for direct in directions {
        let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x)
        
        if next.y < 0 || next.y >= R || next.x < 0 || next.x >= C {
            continue
        }
        if graph[next.y][next.x] == "T"{
            continue
        }
        
        graph[next.y][next.x] = "T"
        count += findWay(depth: depth + 1, now: next)
        graph[next.y][next.x] = "."
    }
    
    
    return count
}


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (R, C, K) = (input[0], input[1], input[2])

var graph = [[Character]](repeating: [Character](repeating: ".", count: C), count: R)
for i in 0 ..< R {
    graph[i] = readLine()!.map{ $0 }
}

graph[R - 1][0] = "T"
print(findWay(depth: 1, now: Coordinate(y: R - 1, x: 0)))
