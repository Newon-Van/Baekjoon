//
//  6046_카잉 달력.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/02.
//

import Foundation

func gcd(_ A: Int, _ B: Int) -> Int {
    if B == 0 {
        return A
    }
    return gcd(B, A % B)
}

var testCase = Int(readLine()!)!
var result = ""

while testCase > 0 {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (M, N, x, y) = (input[0], input[1], input[2], input[3])
    
    let gcd = N > M ? gcd(N, M) : gcd(M, N)
    var isPossible = false
    
    for i in 1 ... (N / gcd) {
        let k = (i - 1) * M + x
        let kY = k % N == 0 ? N : k % N
        
        if kY == y {
            result = "\(k)"
            isPossible = true
            break
        }
    }
    
    if !isPossible {
        result = "-1"
    }
    
    print(result)
    testCase -= 1
}
