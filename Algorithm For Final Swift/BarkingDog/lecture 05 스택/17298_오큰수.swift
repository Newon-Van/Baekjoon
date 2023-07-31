//
//  17298_오큰수.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

let N = Int(readLine()!)!
var input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var stack = [Int]()

for i in 0 ..< N {
    while !stack.isEmpty && input[stack.last!] < input[i] {
        input[stack.removeLast()] = input[i]
    }
    stack.append(i)
}

for i in stack {
    input[i] = -1
}

print(input.map { String($0) }.joined(separator: " "))
