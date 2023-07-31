//
//  2_소수 찾기.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/26.
//

import Foundation

func isPrime(now: String) -> Int? {
    let check = Int(now)!
    if check < 4 {
        if check == 0 {
            return nil
        }
        return check == 1 ? nil : check
    }

    for i in 2 ... Int(sqrt(Double(check))) {
        if check % i == 0 {
            return nil
        }
    }
    return check
}

func dfs(depth : Int, length: Int, now: String, numbers: [Character]) {
    if depth == length {
        return
    }

    var check = now

    for i in 0 ..< numbers.count {
        if visited[i] {
            continue
        }

        visited[i] = true
        check += String(numbers[i])
        if isPrime(now: check) != nil {
            result.insert(Int(check)!)
        }
        dfs(depth: depth + 1, length: length, now: check, numbers: numbers)
        check.removeLast()
        visited[i] = false
    }

    return
}

var visited = [Bool]()
var result = Set<Int>()
func solution(_ numbers:String) -> Int {

    visited = [Bool](repeating: false, count: numbers.count)
    dfs(depth: 0, length: numbers.count, now: "", numbers: Array(numbers))

    return result.count
}

print(solution("011"))
print(result.sorted())
