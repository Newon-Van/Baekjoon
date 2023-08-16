//
//  2504_괄호의 값.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
//

import Foundation

let input = readLine()!
var stack = [Character]()
var result = 0
var tempValue = 1
var last = Character("-")

runLoop: for char in input {
    switch char {
    case "(":
        tempValue *= 2
        stack.append(char)
        last = char
    case "[":
        tempValue *= 3
        stack.append(char)
        last = char

    case ")":
        if stack.isEmpty || stack.last != "(" {
            result = 0
            break runLoop
        }
        
        if last == "(" { result += tempValue }
        stack.removeLast()
        tempValue /= 2
        last = char
    case "]":
        if stack.isEmpty || stack.last != "[" {
            result = 0
            break runLoop
        }
        
        if last == "[" { result += tempValue }
        stack.removeLast()
        tempValue /= 3
        last = char
        
    default: break
    }
}

print(!stack.isEmpty ? 0 : result)
