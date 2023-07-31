//
//  14891_톱니바퀴.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/24.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
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

enum Rotation {
    case left
    case right
}


func rotate(index: Int, rotation: Rotation) {
    switch rotation {
    case .left:
        for i in 0 ..< cogWheel[index].count - 1{
            (cogWheel[index][i], cogWheel[index][i + 1]) = (cogWheel[index][i + 1], cogWheel[index][i])
        }
        
    case .right:
        for i in stride(from: cogWheel[index].count - 1, to: 0, by: -1) {
            (cogWheel[index][i], cogWheel[index][i - 1]) = (cogWheel[index][i - 1], cogWheel[index][i])
        }
    }
}


func check(index: Int, rotation: Rotation) {
    var queue = Queue<Int>()
    queue.enqueue(index)
    
    var visited = Set<Int>()
    
    var condition = [Bool](repeating: false, count: cogWheel.count)
    condition[index] = true
    
    var rotationWay = [Rotation?](repeating: nil, count: cogWheel.count)
    rotationWay[index] = rotation
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        guard 0 ..< cogWheel.count ~= now else { continue }
        guard !visited.contains(now) else { continue }
        
        switch now == now {
        case now < index:
            if cogWheel[now][2] != cogWheel[now + 1][6] && condition[now + 1] {
                condition[now] = true
            }
            rotationWay[now] = rotationWay[now + 1] == .right ? .left : .right
            
        case now > index:
            
            if cogWheel[now][6] != cogWheel[now - 1][2] && condition[now - 1] {
                condition[now] = true
            }
            rotationWay[now] = rotationWay[now - 1] == .right ? .left : .right
            
        default: break
        }
        
        visited.insert(now)
        queue.enqueue(now + 1)
        queue.enqueue(now - 1)
    }
    
    for i in 0 ..< cogWheel.count {
        if condition[i] {
            rotate(index: i, rotation: rotationWay[i]!)
        }
    }
}

func selfPow(_ value: Int) -> Int {
    var result = 1
    
    for _ in 0 ..< value {
        result *= 2
    }
    
    return result
}

var firstCog = readLine()!.map { $0 }
var secondCog = readLine()!.map { $0 }
var thirdCog = readLine()!.map { $0 }
var fourthCog = readLine()!.map { $0 }
var cogWheel = [firstCog, secondCog, thirdCog, fourthCog]

var testCase = Int(readLine()!)!
while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let rotateCog = input[0] - 1
    let rotation = input[1] == 1 ? Rotation.right : Rotation.left
    
    check(index: rotateCog, rotation: rotation)
    testCase -= 1
}

var result = 0

for i in 0 ..< cogWheel.count {
    if cogWheel[i][0] == Character("1") {
        result += selfPow(i)
    }
}

print(result)
