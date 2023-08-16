//
//  12851_숨바꼭질2.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/04.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int {
        input.count + output.count
    }
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        input.append(item)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func bfs() {
    var queue = Queue<Int>()
    queue.enqueue(N)
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for next in [now + 1, now - 1, now * 2] {
            
            if next < 0 || next > 100000 {
                continue
            }
            
            if graph[next] != 0 && graph[next] < graph[now] + 1 {
                continue
            }
            
            if next == K && (graph[next] == 0 || graph[now] + 1 < graph[next]) {
                way = 1
                result = graph[now] + 1
            } else if next == K && graph[next] == graph[now] + 1 {
                way += 1
            }
            
            queue.enqueue(next)
            graph[next] = graph[now] + 1
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (input[0], input[1])

var graph = [Int](repeating: 0, count: 100001)

var result = 0
var way = 0

if N == K {
    way = 1
} else {
    bfs()
}

print(result)
print(way)
