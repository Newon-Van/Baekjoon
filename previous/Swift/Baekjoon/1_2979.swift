//
//  1_2979.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0)) }
let A = input[0], B = input[1], C = input[2]
var timeLine = [Int](repeating: 0, count: 100)
var result = 0

for _ in 1...3 {
    input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for index in input[0]! ..< input[1]! {
        timeLine[index] += 1
    }
}

for i in timeLine {
    if i == 1 {
        result += A!
    }
    else if i == 2 {
        result += B! * 2
    }
    else if i == 3 {
        result += C! * 3
    }
}

print(result)
