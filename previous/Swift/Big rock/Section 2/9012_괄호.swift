//
//  9012_괄호.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/14.
//

let testCase = Int(readLine()!)!

(1...testCase).forEach { _ in
    
    let input = readLine()!
    var stack = [Character]()
    
    input.forEach { ch in
        if stack.last == "(" && ch == ")" {
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }
    
    print(stack.isEmpty ? "YES" : "NO")
}
