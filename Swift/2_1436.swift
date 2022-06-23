//
//  2_1436.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/20.
//

import Foundation

var input = Int(readLine()!)!

var shom = 665
while(input > 0){
    shom += 1
    
    let test = Array(String(shom))
    for i in 0 ... test.count - 3 {
        if test[i] == Character("6") && test[i] == test[i + 1] && test[i + 1] == test[i + 2] {
            input -= 1
            break
        }
    }
    
}

print(shom)


