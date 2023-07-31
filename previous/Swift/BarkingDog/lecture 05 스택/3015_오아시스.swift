//
//  3015_오아시스.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/08.
//

import Foundation

struct Person {
    let height: Int
    var count: Int
}

var stack = [Person]()
var result = 0

let N = Int(readLine()!)!
for _ in 0 ..< N {
    var person = Person(height: Int(readLine()!)!, count: 1)
    
    while !stack.isEmpty && stack.last!.height <= person.height {
        result += stack.last!.count
        
        if stack.last!.height == person.height { person.count += stack.last!.count}
        stack.removeLast()
    }
    
    if !stack.isEmpty { result += 1 }
    stack.append(person)
}

print(result)
