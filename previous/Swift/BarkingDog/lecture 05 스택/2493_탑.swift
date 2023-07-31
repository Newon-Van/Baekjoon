//
//  2493_탑.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/07.
//

import Foundation

readLine()
var towers = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var stack = [Int]() // Stack 에는 자기보다 큰 타워를 만나지 못한 타워들이 담긴다.
var result = [Int](repeating: 0, count: towers.count)

for i in stride(from: towers.count - 1, to: -1, by: -1) {
    // 스택 (자기보다 큰 타워를 만나지 못한 타워들) 을 순회하면서, 현재 가르키는 타워보다 작은 얘들을 성불시켜준다.
    while !stack.isEmpty && towers[i] > towers[stack.last!] {
        let index = stack.removeLast()
        result[index] = i + 1
    }
    // 이제 자기 자신을 스택에 넣는다. (자기보다 큰 타워를 만난 적은 없으니까)
    stack.append(i)
}

result.forEach {
    print($0, terminator: " ")
}
