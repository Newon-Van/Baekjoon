//
//  1629_곱셈.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/12.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B, C) = (input[0], input[1], input[2])

func solve(_ N: Int) -> Int {
    if N == 1 {
        return A % C
    }
    
    var temp = solve(N / 2)
    temp = (temp * temp) % C
    
    if N % 2 == 1 {
        temp = temp * A % C
    }
    
    return temp
}

print(solve(B))
