//
//  3_15686_치킨 배달.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/29.
//

import Foundation

struct Coordinate : Equatable {
    let y: Int
    let x: Int
}

func combination(start:Int, result: [Coordinate]) {
    if result.count == M {
        aliveStoreList.append(result)
        return
    }
    var temp = result
    for i in start + 1 ..< chickenList.count {
        temp.append(chickenList[i])
        combination(start: i, result: temp)
        temp.removeLast()
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var chickenList = [Coordinate]()
var aliveStoreList = [[Coordinate]]()
var homeList = [Coordinate]()
var result = Int.max

for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0 ..< N {
        if graph[i][j] == 2 {
            chickenList.append(Coordinate(y: i, x: j))
        } else if graph[i][j] == 1 {
            homeList.append(Coordinate(y: i, x: j))
        }
    }
}

combination(start: -1, result: [Coordinate]())

for aliveStore in aliveStoreList {
    var temp = 0
    for home in homeList {
        
        var minimum = Int.max
        
        for store in aliveStore {
            let distance = abs(home.y - store.y) + abs(home.x - store.x)
            minimum = min(minimum, distance)
        }
        
        temp += minimum
    }
    result = min(temp, result)
}

print(result)
