//
//  9375_패션왕 신해빈.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/06.
//

var testCase = Int(readLine()!)!

repeat {
    let n = Int(readLine()!)!
    var closet = [String: Int]()
    var result = 1
    
    for _ in 0 ..< n {
        var temp = readLine()!.split(separator: " ").map { String($0) }
        closet[temp[1]] = (closet[temp[1]] ?? 1) + 1
    }
    
    closet.forEach {
        result *= $0.value
    }
    
    print(result - 1)
    
    
    testCase -= 1
} while testCase > 0
