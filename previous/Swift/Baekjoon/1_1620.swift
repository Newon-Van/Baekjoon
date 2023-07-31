//
//  1_1620.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

var input = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
let N = input[0], M = input[1]
var mapSI = [String:Int]()
var mapIS = [Int:String]()

for i in 1 ... N {
    let temp = readLine()!
    mapSI[temp] = i
    mapIS[i] = temp
}

for _ in 1 ... M {
    let temp = readLine()!
    if temp.first!.asciiValue! >= Character("0").asciiValue! && temp.first!.asciiValue! <= Character("9").asciiValue! {
        print(mapIS[Int(temp)!]!)
    } else {
      print(mapSI[temp]!)
    }
}
