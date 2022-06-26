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
                // Map + Set
result = checker.compactMap{ element in
    let count = map[element] ?? 0
    return count > 1 ? count : nil
}

if result.count == 0 {
    result.append(-1)
}

print(result)

// ---------------------------------------------------------


import Foundation

let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var sorting = [Int]()
var map = [Int:Int]()
var result = [Int]()

for i in arr {
    if !sorting.contains(i) {
        sorting.append(i)
    }
    map[i, default: 0] += 1
}

map = map.filter{
    $0.value >= 2
}

sorting = sorting.filter{
    map[$0] != nil
}

sorting.forEach {
    result.append(map[$0]!)
}

print(result)
