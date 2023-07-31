//
//  1406_에디터.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/06.
//

import Foundation

var stackL = Array(readLine()!)
var stackR = [Character]()

var testCase = Int(readLine()!)!

for _ in 0 ..< testCase {
    let operation = readLine()!
    switch operation {
    case "L":
        if !stackL.isEmpty {
            stackR.append(stackL.removeLast())
        }
    case "D":
        if !stackR.isEmpty {
            stackL.append(stackR.removeLast())
        }
    case "B":
        if !stackL.isEmpty {
            stackL.removeLast()
        }
    default:
        stackL.append(operation.last!)
    }
}

print(String(stackL + stackR.reversed()))
