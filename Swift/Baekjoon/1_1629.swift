//
//  1_1629.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let A = input[0], B = input[1], C = input[2]

func solve(N: Int) -> Int {
    if N == 1 {
        return A % C
    }
    
    var temp = solve(N: N / 2)
    temp = (temp * temp) % C
    if N % 2 == 1 {
        temp = (temp * A) % C
    }
    
    return temp
}

var result = solve(N: B)

print(result)
