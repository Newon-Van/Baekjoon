//
//  2828_사과 담기 게임.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/01.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1] - 1)
let J = Int(readLine()!)!
var position = 1
var result = 0

for _ in 0 ..< J {
    let apple = Int(readLine()!)!

    if apple > position + M {
        result += apple - position - M
        position = apple - M
    } else if apple < position {
        result += position - apple
        position = apple
    }
}

print(result)
