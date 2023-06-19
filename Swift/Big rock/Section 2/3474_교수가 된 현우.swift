//
//  3474_교수가 된 현우.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/09.
//

let testCase = Int(readLine()!)!

(1...testCase).forEach { _ in
    let input = Int(readLine()!)!
    var count = 0
    var check = 1
    
    while check <= input {
        check *= 5
        count += input / check
    }
    
    print(count)
}
