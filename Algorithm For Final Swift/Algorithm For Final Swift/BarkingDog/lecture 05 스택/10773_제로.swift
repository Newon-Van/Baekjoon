//
//  10773_제로.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

var stack = [Int]()
var testCase = Int(readLine()!)!

for _ in 0 ..< testCase {
    let input = Int(readLine()!)!
    
    if input == 0 {
        stack.removeLast()
    } else {
        stack.append(input)
    }
}

print(stack.reduce(0, +))
