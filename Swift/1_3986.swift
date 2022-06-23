//
//  1_3986.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

let N = Int(readLine()!)!
var result = 0

for _ in 1 ... N {
    let temp = Array(readLine()!)
    var stack = [Character]()
    
    
    for i in temp {
        if stack.last == i {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
