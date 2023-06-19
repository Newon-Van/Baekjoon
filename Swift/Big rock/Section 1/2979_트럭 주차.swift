//
//  2979_트럭 주차.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/04.
//

import Foundation

let inputTime = readLine()!.split(separator: " ").map{ Int($0)! }
var timeChecker = [Int](repeating: 0, count: 100)
var i = 0
var result = 0

repeat {
    let temp = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    
    for index in temp[0] ..< temp[1] {
        timeChecker[index] += 1
    }
    
    i += 1
} while i < 3

timeChecker.forEach { item in
    switch item {
    case 1: result += inputTime[0]
    case 2: result += inputTime[1] * 2
    case 3: result += inputTime[2] * 3
    default: break
    }
}

print(result)
