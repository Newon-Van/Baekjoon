//
//  2444_별찍기 7.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in 0 ..< n {
    var spaceCounter = n - i - 1
    var starCounter = (2 * i) + 1
    
    while spaceCounter > 0 { print(" ", terminator: ""); spaceCounter -= 1 }
    while starCounter > 0 { print("*", terminator: ""); starCounter -= 1 }
    print()
}

for i in stride(from: n - 2, to: -1, by: -1) {
    var spaceCounter = n - i - 1
    var starCounter = (2 * i) + 1
    
    while spaceCounter > 0 { print(" ", terminator: ""); spaceCounter -= 1 }
    while starCounter > 0 { print("*", terminator: ""); starCounter -= 1 }
    print()
}
