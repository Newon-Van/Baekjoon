//
//  1_1940.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

let material = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted()
var result = 0

for i in 0 ..< material.count - 1 {
    for j in i + 1 ..< material.count {
        if material[i] + material[j] == M {
            result += 1
        }
    }
}

print(result)
