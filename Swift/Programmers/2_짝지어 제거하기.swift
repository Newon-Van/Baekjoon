//
//  2_짝지어 제거하기.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/25.
//

import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = 0
    var stack = [String]()
    
    for character in s {
        if !stack.isEmpty && stack.last! == String(character) {
            stack.removeLast()
        } else {
            stack.append(String(character))
        }
    }
    
    if stack.isEmpty{
        answer = 1
    }

    return answer
}
