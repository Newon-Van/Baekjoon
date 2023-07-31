//
//  3273_두 수의 합.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

readLine()
var arr = [Int](repeating: 0, count: 1000001)

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let target = Int(readLine()!)!
var result = 0

for element in input {
    arr[element] += 1
    
    if 0 ... 1000000 ~= target - element && arr[target - element] > 0 && target - element != element {
        arr[element] -= 1
        arr[target - element] -= 1
        result += 1
    }
}

print(result)
