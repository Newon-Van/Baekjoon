//
//  15686_치킨 배달.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/05.
//

import Foundation

struct Coordinate {
    var x: Int
    var y: Int
}

func combination(start: Int, result: [Coordinate]) {
    if result.count == M {
        aliveChickenList.append(result)
        return
    }
    
    var temp = result
    for i in start + 1 ..< chickenList.count {
        temp.append(chickenList[i])
        combination(start: i, result: temp)
        temp.removeLast()
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
var homeList = [Coordinate]()
var chickenList = [Coordinate]()
var aliveChickenList = [[Coordinate]]()

var graph = [[Int]]()
var result = Int.max

for i in 0 ..< N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
    
    for j in 0 ..< N {
        if graph[i][j] == 1 {
            homeList.append(Coordinate(x: j, y: i))
        }
        if graph[i][j] == 2 {
            chickenList.append(Coordinate(x: j, y: i))
        }
    }
}

combination(start: -1, result: [])

for aliveStore in aliveChickenList {
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


