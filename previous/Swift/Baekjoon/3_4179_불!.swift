//
//  3_4179_불!.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/30.
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

struct Coordinate {
    let y: Int
    let x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func fireRun(){
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for d in directions {
            let next = Coordinate(y: now.y + d.y, x: now.x + d.x)
            
            if next.y < 0 || next.x < 0 || next.y >= C || next.x >= R {
                continue
            }
            if fireTime[next.y][next.x] != Int.max || graph[next.y][next.x] == "#" {
                continue
            }
            fireTime[next.y][next.x] = fireTime[now.y][now.x] + 1
            queue.enqueue(next)
        }
    }
}

func jihoonRun(){
    jihoonTime[jihoon.y][jihoon.x] = 1
    queue.enqueue(jihoon)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for d in directions {
            let next = Coordinate(y: now.y + d.y, x: now.x + d.x)
            
            if next.y < 0 || next.x < 0 || next.y >= C || next.x >= R {
                result = jihoonTime[now.y][now.x]
                return
            }
            
            if jihoonTime[next.y][next.x] > 0 || graph[next.y][next.x] == "#" {
                continue
            }
            if jihoonTime[now.y][now.x] + 1 >= fireTime[next.y][next.x] {
                continue
            }
            
            jihoonTime[next.y][next.x] = jihoonTime[now.y][now.x] + 1
            queue.enqueue(next)
        }
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (C, R) = (input[0], input[1])

var queue = Queue<Coordinate>()
var fireTime = [[Int]](repeating: [Int](repeating: Int.max, count: R), count: C)
var jihoon = Coordinate(y: 0, x: 0)
var jihoonTime = [[Int]](repeating: [Int](repeating: 0, count: R), count: C)
var result = 0

var graph = [[String]](repeating: [String](repeating: " ", count: R), count: C)
for i in 0 ..< C {
    graph[i] = readLine()!.map{ String($0) }
    for j in 0 ..< R {
        if graph[i][j] == "F" {
            fireTime[i][j] = 1
            queue.enqueue(Coordinate(y: i, x: j))
        } else if graph[i][j] == "J" {
            jihoon = Coordinate(y: i, x: j)
        }
    }
}

fireRun()
jihoonRun()
print(result != 0 ? result : "IMPOSSIBLE")
