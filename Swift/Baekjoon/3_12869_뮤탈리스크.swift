//
//  3_12869_뮤탈리스크.swift
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

struct Life : Hashable, Equatable {
    var a: Int
    var b: Int
    var c: Int
}


func getAttackOrder(depth: Int, result: [Int]) {
    if depth == 3 {
        attackOrder.append(result)
        return
    }
    
    var temp = result
    
    for i in 0 ..< 3 {
        if temp.contains(damage[i]) {
            continue
        }
        
        temp.append(damage[i])
        getAttackOrder(depth: depth + 1, result: temp)
        temp.removeLast()
    }
}

func attack(_ start: Life) -> Int {
    var queue = Queue<Life>()
    queue.enqueue(start)
    visited[start.a][start.b][start.c] = 0
    
    outerLoop: while !queue.isEmpty {
        let now = queue.dequeue()
        
        for order in attackOrder {
            let next = Life(a: max(0, now.a - order[0]), b: max(0, now.b - order[1]), c: max(0, now.c - order[2]))
            
            if next.a == 0 && next.b == 0 && next.c == 0 {
                visited[0][0][0] = visited[now.a][now.b][now.c] + 1
                break outerLoop
            }
            
            if visited[next.a][next.b][next.c] >= 0 {
                continue
            }
            visited[next.a][next.b][next.c] = visited[now.a][now.b][now.c] + 1
            queue.enqueue(next)
        }
    }
    
    return visited[0][0][0]
}

let N = Int(readLine()!)!
var scvList = readLine()!.split(separator: " ").map{ Int(String($0))! }
var start = Life(a: 0, b: 0, c: 0)
scvList.enumerated().forEach { index, life in
    if index == 0 {
        start.a = life
    } else if index == 1 {
        start.b = life
    } else {
        start.c = life
    }
}

var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 61), count: 61), count: 61)
var attackOrder = [[Int]]()
let damage = [9, 3, 1]

getAttackOrder(depth: 0, result: [Int]())
print(attack(start))
