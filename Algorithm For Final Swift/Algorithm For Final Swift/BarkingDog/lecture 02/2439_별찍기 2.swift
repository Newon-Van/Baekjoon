//
//  2439_별찍기 2.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!
for i in 0 ..< n {
    print(String(repeating: " ", count: n - i - 1), terminator: "")
    print(String(repeating: "*", count: i + 1), terminator: "")
    print()
}

//MARK: - while

let n = Int(readLine()!)!
for i in 0 ..< n {
    var spaceCounter = n - i - 1
    var starCounter = i + 1
    
    while spaceCounter > 0 { print(" ", terminator: ""); spaceCounter -= 1 }
    while starCounter > 0 { print("*", terminator: ""); starCounter -= 1 }
    
    print()
}


