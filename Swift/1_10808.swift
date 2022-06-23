//
//  1_2979.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

let input = readLine()!
var arr = [Int](repeating: 0, count: 26)

for i in input.utf16 {
    arr[Int(i) - Int(("a" as Character).asciiValue!)] += 1
}

arr.forEach{
    print("\($0)" + " ", terminator: "")
}
