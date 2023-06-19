//
//  6198_옥상 정원 꾸미기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

let n = Int(readLine()!)!
var stack = [Int]()
var result = 0

for _ in 0 ..< n {
    let height = Int(readLine()!)!
    
    if stack.isEmpty { stack.append(height); continue }
    
    while !stack.isEmpty && stack.last! <= height {
        stack.removeLast()
    }
    
    result += stack.count
    stack.append(height)
}

print(result)
