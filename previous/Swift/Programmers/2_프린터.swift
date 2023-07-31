//
//  2_프린터.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/03.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority = priorities
    var myPaper = location
    var answer = 0
    
    while true {
        if priority.first == priority.max() {
            priority.removeFirst()
            answer += 1
            
            if myPaper == 0 {
                break
            } else {
                myPaper -= 1
            }
            
        } else {
            priority.append(priority.removeFirst())
            
            if myPaper == 0 {
                myPaper = priority.count - 1
            } else {
                myPaper -= 1
            }
        }
    }
    
    
    return answer
}
