//
//  2_4949.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/20.
//

import Foundation

var input = readLine()!
while input != "." {
    let test = Array(input)
    var stack = [Character]()
    for char in test {
        if char == "(" || char == "[" {
            stack.append(char)
        }
        else if char == ")" && stack.last == "("{
            stack.removeLast()
        } else if char == "]" && stack.last == "[" {
            stack.removeLast()
        } else if char == ")" || char == "]" {
            stack.append(char)
        }
    }
    
    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
    
    stack.removeAll()
    input = readLine()!
}
