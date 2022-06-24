//
//  boostCamp_problem.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/15.
//

import Foundation

let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = [Int:Int]()
var checker = [Int]()
var result = [Int]()

arr.forEach { element in
    if let value = map[element] {
        map[element] = value + 1
    }
    else {
        map[element] = 1
        checker.append(element)
    }
}

result = checker.compactMap{ element in
    let count = map[element] ?? 0
    return count > 1 ? count : nil
}

if result.count == 0 {
    result.append(-1)
}

print(result)
