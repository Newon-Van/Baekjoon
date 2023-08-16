//
//  14888_연산자 끼워넣기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/20.
//

import Foundation

func execute(depth: Int, now: Int) {
    if depth == n {
        maxResult = max(maxResult, now)
        minResult = min(minResult, now)
        return
    }
    
    for i in 0 ..< 4 {
        guard operation[i] > 0 else { continue }
        var newValue = now
        
        switch i {
        case 0: newValue += numbers[depth]
        case 1: newValue -= numbers[depth]
        case 2: newValue *= numbers[depth]
        case 3: newValue /= numbers[depth]
        default: break
        }
        
        operation[i] -= 1
        execute(depth: depth + 1, now: newValue)
        operation[i] += 1
    }
}

let n = Int(readLine()!)!
let numbers = readLine()!.split { $0 == " " }.map { Int($0)! }
var operation = readLine()!.split { $0 == " " }.map { Int($0)! }

var maxResult = Int.min
var minResult = Int.max

execute(depth: 1, now: numbers[0])
print(maxResult)
print(minResult)
