//
//  2_2910.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/17.
//

import Foundation
typealias Count = (frequency: Int, value: Int, order: Int)

var input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = input[0], C = input[1]

input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var counter = [Int:[Int]]()

var order = 0
input.forEach {
    if counter.keys.contains($0) {
        counter[$0]![0] += 1
    } else {
        counter[$0] = [1, order]
        order += 1
    }
}

var resultNums = [Count]()
var result = ""

for i in counter {
    resultNums.append(Count(i.value[0], i.key, i.value[1]))
}

resultNums.sort {
    $0.frequency == $1.frequency ? $0.order < $1.order : $0.frequency > $1.frequency
}

resultNums.forEach {
    result += String(repeating: "\($0.value) ", count: $0.frequency)
}

print(result)
