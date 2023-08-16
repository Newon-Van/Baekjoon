//
//  10808_알파벳 개수.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

var array = [Int](repeating: 0, count: 26)
let input = readLine()!.map { Int(String($0.asciiValue! - Character("a").asciiValue!))! }
input.forEach { array[$0] += 1 }
array.forEach { print($0, terminator: " ") }
