//
//  1_로또의 최고 순위와 최저 순위.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/05.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var count = 0
    var zeroCount = 0
    
    for lottery in lottos {
        if lottery == 0 {
            zeroCount += 1
            continue
        }
        for winNum in win_nums {
            if lottery == winNum {
                count += 1
                break
            }
        }
    }
    
    var maximum = 7 - count - zeroCount
    if maximum < 1 {
        maximum = 1
    } else if maximum == 7 {
        maximum = 6
    }
    
    var minimum = 7 - count
    if minimum > 5 {
        minimum = 6
    }
    
    return [maximum, minimum]
}
