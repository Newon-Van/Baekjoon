//
//  2_2828_사과 담기 게임.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (input[0], input[1])
var J = Int(readLine()!)!
var left = 1
var right = 0
var result = 0

for _ in 0 ..< J {
    right = left + M - 1
    let temp = Int(readLine()!)!
    
    if temp >= left && temp <= right {
        continue
    } else {
        if temp < left {
            left = temp
            result += left - temp
        } else {
            left += temp - right
            result += temp - right
        }
    }
}

print(result)
