//
//  1940_주몽.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/12.
//

var N = Int(readLine()!)!
var M = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = 0

for i in input {
    if input.contains(M - i) {
        result += 1
    }
}

print(result / 2)
