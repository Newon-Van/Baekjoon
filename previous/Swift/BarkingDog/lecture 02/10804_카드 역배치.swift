//
//  10804_카드 역배치.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

func reverse(_ a: Int, _ b: Int) {
    for i in 0 ..< (b - a + 1) / 2 {
        (cardList[a + i], cardList[b - i]) = (cardList[b - i], cardList[a + i])
    }
}

var cardList = [Int](1 ... 20)
var testCase = 10

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    reverse(input[0], input[1])
    
    testCase -= 1
}

cardList.forEach { print($0, terminator: " ") }

//MARK: - 혹은
var cardList = [Int](1 ... 20)
var testCase = 10

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    cardList[input[0] ... input[1]].reverse()
    
    testCase -= 1
}

cardList.forEach { print($0, terminator: " ") }

//MARK: - 왜인지 모르지만 속도는 4ms 이게 더 빠름

var cardList = [Int](1 ... 20)
var testCase = 10

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    cardList.replaceSubrange(input[0] ... input[1], with: cardList[input[0] ... input[1]].reversed())
    
    testCase -= 1
}

cardList.forEach { print($0, terminator: " ") }
