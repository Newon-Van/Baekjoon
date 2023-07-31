//
//  13335_트럭.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/03.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    var first: T? {
        output.last ?? input.first
    }
    
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Truck {
    var weight: Int
    var time: Int
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, W, L) = (input[0], input[1], input[2])
var trucks = Queue<Int>()

readLine()!.split { $0 == " " }.map {
    let value = Int($0)!
    trucks.enqueue(value)
}

var bridge = Queue<Truck>()
var bridgeWeight = 0
var currentTime = 0

while !trucks.isEmpty || !bridge.isEmpty {
    currentTime += 1
    if !bridge.isEmpty && currentTime - bridge.first!.time == W {
        bridgeWeight -= bridge.dequeue().weight
    }
    
    if !trucks.isEmpty && bridgeWeight + trucks.first! <= L {
        let value = trucks.dequeue()
        
        bridge.enqueue(Truck(weight: value, time: currentTime))
        bridgeWeight += value
    }
}

print(currentTime)
