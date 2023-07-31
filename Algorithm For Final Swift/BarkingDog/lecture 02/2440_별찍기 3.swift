//
//  2440_별찍기 3.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in stride(from: n, to: 0, by: -1) {
    var index = i
    while index > 0 { print("*", terminator: ""); index -= 1 }
    
    print()
}
