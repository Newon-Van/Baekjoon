//
//  2447_별찍기 10.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

func recursive(n: Int, pattern: [String]) {
    if n == 1 {
        pattern.forEach { print($0) }
        return
    }
    
    let row1 = pattern.map { $0 + $0 + $0 }
    let row2 = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    
    recursive(n: n / 3, pattern: row1 + row2 + row1)
}

let n = Int(readLine()!)!
recursive(n: n, pattern: ["*"])
