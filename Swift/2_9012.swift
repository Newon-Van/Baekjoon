//
//  2_9012.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/20.
//

import Foundation

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = Array(readLine()!)
    
    var stack = [Character]()
    for char in input {
        if stack.isEmpty || stack.last == char || (stack.last == ")" && char == "(") {
            stack.append(char)
        } else {
            stack.removeLast()
        }
    }
    
    if stack.isEmpty {
        print("YES")
    } else {
        print("NO")
    }
    
    stack.removeAll()
    testCase -= 1
}
