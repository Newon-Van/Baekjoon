//
//  problem_1.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

let input = readLine()!.map { Int(String($0))! }
var hash = [Int:Int]()
var organize = [Int]()
var result = [Int]()

input.forEach {
    hash[$0, default: 0] += 1
    if !organize.contains($0) { organize.append($0) }
}

organize.forEach {
    if hash[$0]! > 1 { result.append(hash[$0]!) }
}

print(result.isEmpty ? [-1] : result)
