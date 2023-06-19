//
//  1475_방 번호.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

var numbers = [Int](repeating: 0, count: 10)
let input = readLine()!
var answer = 0

input.forEach {
    let index = Int(String($0))!
    numbers[index] += 1
}

for i in numbers.indices {
    if i == 6 || i == 9 { continue }
    answer = max(answer, numbers[i])
}

let sixNine = Int(ceil((Double(numbers[6]) + Double(numbers[9])) / Double(2)))
answer = max(answer, sixNine)
print(answer)

//MARK: - Another

func buyNumbers(_ index: Int) {
    result += 1
    
    for i in numbers.indices { numbers[i] += 1 }
    numbers[index] -= 1
}

var numbers = [Int](repeating: 0, count: 10)
var result = 0
let input = readLine()!

input.forEach {
    let index = Int(String($0))!
    
    if numbers[index] == 0 {
        if index == 6 && numbers[9] > 0 {
            numbers[9] -= 1
        } else if index == 9 && numbers[6] > 0 {
            numbers[6] -= 1
            
        } else {
            buyNumbers(index)
        }
    } else {
        numbers[index] -= 1
    }
}

print(result)
