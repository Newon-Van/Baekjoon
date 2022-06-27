//
//  2_2870.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/17.
//

import Foundation

var testCase = Int(readLine()!)!
var result = [String]()
var isZero = false

while testCase > 0 {
    let input = Array(readLine()!)
    var integer = ""
    
    for i in 0 ..< input.count {
        if integer == "" && i != input.count - 1 && input[i] == "0" && (input[i + 1] >= "0" && input[i + 1] <= "9")  {
            continue
        }
        
        if input[i] >= "0" && input[i] <= "9" {
            integer += String(input[i])
            
            if i == input.count - 1 {
                result.append(integer)
            }
            else if input[i + 1] > "9" || input[i + 1] < "0" {
                result.append(integer)
                integer = ""
            }
        }
    }
    
    testCase -= 1
}

//result.sort{ (first, second) -> Bool in
//    if first.count == second.count {
//        return first < second
//    } else {
//        return first.count < second.count
//    }
//}

result.sort{
    $0.count == $1.count ? : $0 < $1 : $0.count < $1.count
}

result.forEach{
    print($0)
}
