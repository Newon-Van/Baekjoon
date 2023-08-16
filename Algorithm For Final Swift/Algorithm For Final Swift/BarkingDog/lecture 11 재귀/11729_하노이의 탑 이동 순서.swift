//
//  11729_하노이의 탑 이동 순서.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/14.
//

import Foundation

func hanoi(a: Int, b: Int, c: Int, n: Int) {
    count += 1
    if n == 1 {
        answer += "\(a) \(b)\n"
        return
    }
    
    hanoi(a: a, b: c, c: b, n: n - 1)
    answer += "\(a) \(b)\n"
    hanoi(a: c, b: b, c: a, n: n - 1)
}


let n = Int(readLine()!)!

var count = 0
var answer = ""
hanoi(a: 1, b: 3, c: 2, n: n)

print(count)
print(answer)
