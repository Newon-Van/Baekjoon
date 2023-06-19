//
//  2445_별찍기 8.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

let n = Int(readLine()!)!

for i in 0 ..< n {
    for j in 0 ..< 2 * n {
        if 0 ... i ~= j || 2 * n - 1 - i ... 2 * n - 1 ~= j {
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    print()
}

for i in stride(from: n - 2, to: -1, by: -1){
    for j in 0 ..< 2 * n {
        if 0 ... i ~= j || 2 * n - 1 - i ... 2 * n - 1 ~= j {
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    print()
}
