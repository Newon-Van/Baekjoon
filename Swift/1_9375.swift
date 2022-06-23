//
//  1_9375.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

let testCase = Int(readLine()!)!

for _ in 1 ... testCase {
    let n = Int(readLine()!)!
    
    var closet:Dictionary<String, Int> = [:]
    var result = 1

    for _ in 0 ..< n {
        let cloth = readLine()!.split(separator: " ").map(String.init)
        closet[cloth[1], default: 0] += 1
    }

    for i in closet {
        result *= (i.value + 1)
    }
    print(result - 1)
}
