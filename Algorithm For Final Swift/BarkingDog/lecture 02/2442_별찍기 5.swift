//
//  2442_별찍기 5.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in 0 ..< n {
    
    var leftSpaceCounter = n - i - 1
    var leftStarCounter = i + 1

    var rightStarCounter = i
    
    while leftSpaceCounter > 0 { print(" ", terminator: ""); leftSpaceCounter -= 1 }
    while leftStarCounter > 0 { print("*", terminator: ""); leftStarCounter -= 1 }
    while rightStarCounter > 0 { print("*", terminator: ""); rightStarCounter -= 1 }
    print()
}
