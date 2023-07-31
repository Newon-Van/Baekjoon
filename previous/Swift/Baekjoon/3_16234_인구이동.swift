//
//  3_16234_인구이동.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/30.
//

import Foundation

struct Coordinate : Hashable, Equatable {
    let y: Int
    let x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func find(start: Coordinate, list: Set<Coordinate>) -> Set<Coordinate> {
    var temp = list
    
    for d in directions {
        let next = Coordinate(y: start.y + d.y, x: start.x + d.x)
        
        if next.y < 0 || next.x < 0 || next.y >= N || next.x >= N {
            continue
        }
        if visited[next.y][next.x] {
            continue
        }
        let a = graph[start.y][start.x]; let b = graph[next.y][next.x]
        
        if abs(a - b) < L || abs(a - b) > R {
            continue
        }
        
        temp.insert(next)
        visited[next.y][next.x] = true
        temp = temp.union(find(start: next, list: list))
    }
    
    return temp
}

func go(y: Int, x: Int, list: Set<Coordinate>) -> Set<Coordinate> {
    var temp = list
    
    for d in directions {
        let next = Coordinate(y: y + d.y, x: x + d.x)
        
        if next.y < 0 || next.x < 0 || next.y >= N || next.x >= N {
            continue
        }
        if visited[next.y][next.x] {
            continue
        }
        
        let a = graph[y][x]; let b = graph[next.y][next.x]
        
        if abs(a - b) < L || abs(a - b) > R  {
            continue
        }
        
        visited[next.y][next.x] = true
        temp.insert(next)
        temp = temp.union(find(start: next, list: list))
    }
    
    if !temp.isEmpty {
        let value = temp.reduce(into: 0) { $0 += graph[$1.y][$1.x] } / temp.count
        
        for coordinate in temp {
            graph[coordinate.y][coordinate.x] = value
        }
    }
    
    return temp
}


var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, L, R) = (input[0], input[1], input[2])

var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var resultList = Set<Coordinate>()
var time = 0

while true {
    time += 1
    
    for i in 0 ..< N {
        for j in 0 ..< N {
            if visited[i][j] {
                continue
            }
            resultList = resultList.union(go(y: i, x: j, list: Set<Coordinate>()))
        }
    }
    
    if resultList.isEmpty {
        break
    }
    
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    resultList.removeAll()
}

print(time - 1)
