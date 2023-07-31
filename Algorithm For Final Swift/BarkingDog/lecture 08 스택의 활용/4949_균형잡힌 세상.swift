//
//  4949_균형잡힌 세상.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
//

import Foundation

while true {
    let input = readLine()!
    guard input != "." else { break }
    
    var stack = [Character]()
    
    input.forEach {
        switch $0 {
        case "(": stack.append($0)
        case "[": stack.append($0)
        case ")": if stack.last == "(" { stack.removeLast() } else { stack.append($0) }
        case "]": if stack.last == "[" { stack.removeLast() } else { stack.append($0) }
        default: break
        }
    }
    
    stack.isEmpty ? print("yes") : print("no")
}
