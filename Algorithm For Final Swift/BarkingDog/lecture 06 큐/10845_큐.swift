//
//  10845_큐.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/08.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    var count: Int {
        return input.count + output.count
    }
    var front: T? {
        return output.isEmpty ? input.first : output.last
    }
    var back: T? {
        return input.isEmpty ? output.first : input.last
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

let n = Int(readLine()!)!
var queue = Queue<Int>()

for _ in 0 ..< n {
    let operation = readLine()!.split { $0 == " " }
    
    switch operation[0] {
    case "push": queue.enqueue(Int(operation[1])!)
    case "pop": print(queue.isEmpty ? -1 : queue.dequeue())
    case "size": print(queue.count)
    case "empty": print(queue.isEmpty ? 1 : 0)
    case "front": print(queue.front ?? -1)
    case "back": print(queue.back ?? -1)
    default: break
    }
}
