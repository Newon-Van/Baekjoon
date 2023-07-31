//
//  2_10709.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/17.
//

import Foundation

typealias Coordinate = (y: Int, x: Int, time: Int, prev: Character)

func solve(startH: Int) {
    for i in 0 ..< W {
        if graph[startH][i] == "." {
            continue
        } else {
            timeGraph[startH][i] = 0
        }

        for j in 1 ..< W - i {
            timeGraph[startH][i + j] = timeGraph[startH][i] + j
        }
    }
}

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let H = input[0], W = input[1]
var graph = [[Character]](repeating: [Character](repeating: Character("."), count: W), count: H)
var timeGraph = [[Int]](repeating: [Int](repeating: -1, count: W), count: H)

for i in 0 ..< H {
    graph[i] = Array(readLine()!)
}

for i in 0 ..< H {
    solve(startH: i)
}

for i in timeGraph {
    i.forEach{
        print($0, terminator: " ")
    }
    print()
}
