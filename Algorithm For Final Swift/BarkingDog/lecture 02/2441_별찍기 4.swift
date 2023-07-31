//
//  2441_별찍기 4.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in stride(from: n, to: 0, by: -1) {
    var spaceCount = n - i
    var starCount = i
    
    while spaceCount > 0 { print(" ", terminator: ""); spaceCount -= 1 }
    while starCount > 0 { print("*", terminator: ""); starCount -= 1 }
    
    print()
}
