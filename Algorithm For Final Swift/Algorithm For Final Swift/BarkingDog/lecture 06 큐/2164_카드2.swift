//
//  2164_카드2.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/08.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    var count: Int {
        input.count + output.count
    }
    
    mutating func enqueue(_ value: T) {
        input.append(value)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

var queue = Queue<Int>()
let n = Int(readLine()!)!

for i in 1 ... n {
    queue.enqueue(i)
}

while queue.count > 1 {
    queue.dequeue()
    queue.enqueue(queue.dequeue())
}

print(queue.dequeue())
