//
//  2870_수학숙제.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/09.
//

let N = Int(readLine()!)!
let string = (1...N).compactMap { _ in readLine() }.joined(separator: "\n")

string.split { (ch) -> Bool in
    Int("\(ch)") == nil
}
.map { (number) in
    number.allSatisfy { $0 == "0"} ? "0" : number.drop { $0 == "0"}
}
.sorted { ($0.count, $0) < ($1.count, $1) }
.forEach { print($0) }
