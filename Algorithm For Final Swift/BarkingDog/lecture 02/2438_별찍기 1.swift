//
//  2438_별찍기 1.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/31.
//

import Foundation

for i in 0 ..< Int(readLine()!)! {
    var index = 0
    
    while index <= i {
        print("*", terminator: "")
        index += 1
    }
    print()
}
