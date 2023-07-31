//
//  숫자.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/30.
//

import Foundation

var result = [String]()
let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }.sorted()

for i in input[0] ..< input[1] {
    if i == input[0] { continue }
    result.append(String(i))
}

print(result.count)
if !result.isEmpty {
    print(result.joined(separator: " "))
}
초
