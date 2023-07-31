//
//  10799_쇠막대기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/09.
//

import Foundation

let input = readLine()!
var stack = [Character]()
var last: Character = Character("-")

var result = 0

input.forEach {
    switch $0 {
    case ")" where last == "(":
        stack.removeLast()
        result += stack.count
    case ")" where last == ")":
        stack.removeLast()
        result += 1
    default: stack.append($0)
    }
    last = $0
}

print(result)
