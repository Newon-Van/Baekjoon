//
//  11328_Strfry.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

var testCase = Int(readLine()!)!

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { $0.sorted() }
    if input[0] == input[1] { print("Possible") } else { print("Impossible") }
    testCase -= 1
}
