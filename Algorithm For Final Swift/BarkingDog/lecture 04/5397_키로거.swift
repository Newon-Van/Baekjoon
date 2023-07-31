//
//  5397_키로거.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/06.
//

import Foundation

var testCase = Int(readLine()!)!

for _ in 0 ..< testCase {
    let input = readLine()!
    var stackL = [Character]()
    var stackR = [Character]()
    
    input.forEach {
        switch $0 {
        case "<":
            if !stackL.isEmpty {
                stackR.append(stackL.removeLast())
            }
        case ">":
            if !stackR.isEmpty {
                stackL.append(stackR.removeLast())
            }
        case "-":
            if !stackL.isEmpty {
                stackL.removeLast()
            }
        default: stackL.append($0)
        }
    }
    print(String(stackL + stackR.reversed()))
}
