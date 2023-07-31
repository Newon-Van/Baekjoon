//
//  1874_스택 수열.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

let n = Int(readLine()!)!
var stack = [Int]()
var result = ""
var counter = 0
var isPossible = true

runLoop: for _ in 0 ..< n {
    var input = Int(readLine()!)!
    
    while counter < input {
        counter += 1
        stack.append(counter)
        result += "+\n"
    }
    
    while stack.last != input {
        if stack.isEmpty {
            isPossible.toggle()
            break runLoop
        }
        
        stack.removeLast()
        result += "-\n"
    }
    stack.removeLast()
    result += "-\n"
}

isPossible ? print(result) : print("NO")
