//
//  1_4375.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/15.
//

while let input = Int(readLine() ?? "") {
    var temp = 1
    var result = 1
    
    while true {
        if (temp % input == 0) {
            print(result)
            break;
        }
        
        temp = (temp * 10) + 1
        temp %= input
        result += 1
    }
}
