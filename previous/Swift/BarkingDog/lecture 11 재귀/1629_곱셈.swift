//
//  1629_곱셈.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

func recursive(n: Int) -> Int {
    if n == 1 { return A % C }
    
    var value = recursive(n: n / 2)
    value = (value % C) * (value % C)
    
    if n % 2 == 1 { value = (value % C) * (A % C) }
    return value % C
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
var (A, B, C) = (input[0], input[1], input[2])

print(recursive(n: B))
