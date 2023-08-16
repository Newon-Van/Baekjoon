//
//  10988_팰린드롬인지 확인하기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/04.
//

import Foundation

let input = readLine()!.map { $0 }
var isPD = 1

for i in 0 ..< input.count / 2 {
    if input[i] != input[input.endIndex - 1 - i] {
        isPD = 0
    }
}

print(isPD)
