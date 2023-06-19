//
//  10807_개수 세기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

readLine()
let arr = readLine()!.split{ $0 == " " }.map { Int($0)! }
let target = Int(readLine()!)
var result = 0

for element in arr { if element == target { result += 1 } }
print(result)
