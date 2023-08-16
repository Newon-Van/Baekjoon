//
//  10828_스택.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

var testCase = Int(readLine()!)!
var stack = [String]()

for _ in 0 ..< testCase {
    let operation = readLine()!.split { $0 == " " }
    
    switch operation[0] {
    case "push":
        stack.append(String(operation[1]))
    case "pop":
        if stack.isEmpty { print("-1") }
        else { print(stack.removeLast()) }
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? "1" : "0")
    case "top":
        if stack.isEmpty { print("-1") }
        else { print(stack.last!) }
    default: break
    }
}
