//
//  2_3474.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/18.
//

import Foundation

var testCase = Int(readLine()!)!

for _ in 1 ... testCase {
    let input = Int(readLine()!)!
    var count = 0
    var check = 1
    
    while check <= input {
        check *= 5
        count += input / check
    }
    
    print(count)
}
