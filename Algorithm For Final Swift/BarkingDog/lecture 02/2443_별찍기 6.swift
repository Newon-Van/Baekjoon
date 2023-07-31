//
//  2444_별찍기 6.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in stride(from: n, to: 0, by: -1) {
    var leftSpaceCounter = n - i
    var starCounter = 2 * i - 1
    
    while leftSpaceCounter > 0 { print(" ", terminator: ""); leftSpaceCounter -= 1 }
    while starCounter > 0 { print("*", terminator: ""); starCounter -= 1 }
    print()
}

