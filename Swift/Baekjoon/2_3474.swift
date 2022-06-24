//
//  2_3474.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/18.
//

import Foundation

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = Int(readLine()!)!
    var fiveCount = 0
    
    for i in 1 ... input {
        var temp = i
        
        if temp % 5 == 0 {
            while temp % 5 == 0 {
                fiveCount += 1
                temp /= 5
            }
        }
        
    }
    count = count + fiveCount
    
    print(count)
    
    fiveCount = 0
    testCase -= 1
}
