//
//  10808_알파벳 개수.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/02.
//

// Counting star 는 맵 또는 배열
// 맵 - String
// 배열 - Int (단, 10만 - 100만 - 1000만 등 sparse 하게 들어오면 맵을 쓰기)
// * 보통 배열은 1000만 정도 되면 공간복잡도 터짐
// A 는 65 a 는 97

import Foundation

let input = readLine()!
var result = [Int](repeating: 0, count: 26)


input.utf8.forEach { item in
    result[Int(item - UInt8(Character("a").asciiValue!))] += 1
}

result.forEach { item in
    print(item, terminator: " ")
}
