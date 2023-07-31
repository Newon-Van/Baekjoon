//
//  2577_숫자의 개수.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let value = A * B * C

var result = [Int](repeating: 0, count: 10)
String(value).forEach { result[Int(String($0))!] += 1 }

result.forEach { print($0) }
