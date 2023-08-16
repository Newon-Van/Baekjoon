//
//  3986_좋은 단어.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
//

import Foundation

var testCase = Int(readLine()!)!
var result = 0

while testCase > 0 {
    let input = readLine()!
    var stack = [Character]()
    
    input.forEach {
        switch $0 {
        case "A" where stack.last == "A": stack.removeLast()
        case "B" where stack.last == "B": stack.removeLast()
        default: stack.append($0)
        }
    }
    
    stack.isEmpty ? result += 1 : ()
    
    testCase -= 1
}

print(result)
