//
//  3_12851_숨바꼭질2.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/30.
//

import Foundation

struct Queue<T>{
    var input = [T]()
    var output = [T]()
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    var count : Int {
        return input.count + output.count
    }
    
    mutating func enqueue(_ element: T){
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

func find(){
    var queue = Queue<Int>()
    queue.enqueue(N)
    distance[N] = 0
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for next in [now + 1, now - 1, now * 2] {
            
            if next < 0 || next > 100000 {
                continue
            }
            
            if distance[next] != 0 && distance[next] < distance[now] + 1 {
                continue
            }
            
            if next == K && (distance[next] == 0 || distance[now] + 1 < distance[next]) {
                time = distance[now] + 1
                way = 1
            } else if next == K && distance[next] == distance[now] + 1{
                way += 1
            }
            
            queue.enqueue(next)
            distance[next] = distance[now] + 1
        }
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, K) = (input[0], input[1])
var distance = [Int](repeating: 0, count: 100001)

var time = 0
var way = 0

if N == K {
    way = 1
} else {
    find()
}

print(time)
print(way)
