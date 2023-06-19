//
//  4949_균형잡힌 세상.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/14.
//

var input = readLine()!
while input != "." {
    var stack = [Character]()
    
    input.forEach { ch in
        
        switch ch {
        case ")" where stack.last == "(" : stack.removeLast()
        case "]" where stack.last == "[" : stack.removeLast()
        case "(", ")", "[", "]": stack.append(ch)
        default: break
        }
    }
    
    print(stack.isEmpty ? "yes" : "no")
    input = readLine()!
}
