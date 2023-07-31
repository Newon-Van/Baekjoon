//
//  2309_일곱 난쟁이.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/02.
//

import Foundation

func solve() -> (first: Int, second: Int) {
    for i in 0 ... 8 {
        for j in 0 ..< i {
            if sum - input[i] - input[j] == 100 {
                return (input[i], input[j])
            }
        }
    }
    
    return (-1, -1)
}

var input = [Int]()
var sum = 0

for _ in 0 ... 8 {
    input.append(Int(readLine()!)!)
    sum += input.last!
}

input.sort()

var except = solve()

input.forEach { item in
    if item != except.first && item != except.second {
        print(item)
    }
}
