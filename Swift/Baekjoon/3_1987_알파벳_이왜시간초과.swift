//
//  3_1987_알파벳_이왜시간초과.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/01.
//

import Foundation

struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    var count : Int {
        return input.count + output.count
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate : Hashable, Equatable {
    let y: Int
    let x: Int
    let time : Int
}

let directions = [
    Coordinate(y: -1, x: 0, time: 0),
    Coordinate(y: 1, x: 0, time: 0),
    Coordinate(y: 0, x: -1, time: 0),
    Coordinate(y: 0, x: 1, time: 0)
]

func go(depth: Int, now: Coordinate) {
    if result >= 26 {
        return
    }
    
    for d in directions {
        let next = Coordinate(y: now.y + d.y, x: now.x + d.x, time: now.time + 1)
        
        if next.y < 0 || next.x < 0 || next.y >= R || next.x >= C {
            continue
        }
        
        if visited[next.y][next.x] {
            continue
        }
        
        if trace[Int(exactly: Character(graph[next.y][next.x]).asciiValue! - Character("A").asciiValue!)!] {
            result = max(result, depth)
            continue
        }
        
        visited[next.y][next.x] = true
        trace[Int(exactly: Character(graph[next.y][next.x]).asciiValue! - Character("A").asciiValue!)!] = true
        go(depth: depth + 1, now: next)
        trace[Int(exactly: Character(graph[next.y][next.x]).asciiValue! - Character("A").asciiValue!)!] = false
        visited[next.y][next.x] = false
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (R, C) = (input[0], input[1])

var graph = [[String]](repeating: [String](repeating: " ", count: C), count: R)
for i in 0 ..< R {
    graph[i] = readLine()!.map{ String($0) }
}
var trace = [Bool](repeating: false, count: 26)
var result = 0
var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)

trace[Int(exactly: Character(graph[0][0]).asciiValue! - Character("A").asciiValue!)!] = true
visited[0][0] = true
go(depth: 1, now: Coordinate(y: 0, x: 0, time: 1))
print(result)
