//
//  1074_Z.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, r, c) = (input[0], input[1], input[2])

func recursive(_ n: Int, _ i: Int, _ j: Int) -> Int {
    if n == 0 { return 0 }
    
    let half = 1 << (n - 1)
    
    if i < half && j < half { return recursive(n - 1, i, j) }
    if i < half && j >= half { return (half * half) + recursive(n - 1, i, j - half) }
    if i >= half && j < half { return (2 * half * half) + recursive(n - 1, i - half, j) }
    return (3 * half * half) + recursive(n - 1, i - half, j - half)
}

print(recursive(n, r, c))
