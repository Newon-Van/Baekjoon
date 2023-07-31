//
//  1267_핸드폰 요금.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/30.
//

import Foundation

readLine()
let input = readLine()!.split { $0 == " " }.map { Int($0)! }

var yCost = 0
var mCost = 0
input.forEach {
    yCost += (($0 / 30) + 1) * 10
    mCost += (($0 / 60) + 1) * 15
}

yCost < mCost ? print("Y \(yCost)") : yCost == mCost ? print("Y M \(yCost)") : print("M \(mCost)")
