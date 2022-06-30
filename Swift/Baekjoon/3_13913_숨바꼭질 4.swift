//
//  3_13913_숨바꼭질 4.swift
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

struct Position {
    var time : Int
    var previousPosition: Int
}

func find(){
    var queue = Queue<Int>()
    queue.enqueue(N)
    distance[N].time = 0
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for next in [now + 1, now - 1, now * 2] {
            if next < 0 || next > 100000 {
                continue
            }
            
            if distance[next].time != 0 && distance[next].time < distance[now].time + 1 {
                continue
            }
            
            if next == K && (distance[next].time == 0 || distance[now].time + 1 < distance[next].time) {
                time = distance[now].time + 1
                distance[next].previousPosition = now
                
                var trace = next
                while trace != N {
                    resultTrace.append(trace)
                    trace = distance[trace].previousPosition
                }
                resultTrace.append(N)
                return
            }
            
            queue.enqueue(next)
            distance[next].time = distance[now].time + 1
            distance[next].previousPosition = now
        }
    }
    
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, K) = (input[0], input[1])
var distance = [Position](repeating: Position(time: 0, previousPosition: 0), count: 100001)
var time = 0
var resultTrace = [Int]()

if N == K {
    print(0)
    print(N)
} else {
    find()
    
    print(time)
    resultTrace.reversed().forEach {
        print($0, terminator: " ")
    }
}
