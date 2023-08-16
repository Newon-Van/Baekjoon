//
//  9012_괄호.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
//

import Foundation

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = readLine()!
    var stack = [Character]()
    
    input.forEach {
        switch $0 {
        case ")" where stack.last == "(": stack.removeLast()
        default: stack.append($0)
        }
    }
    stack.isEmpty ? print("YES") : print("NO")
    
    testCase -= 1
}
