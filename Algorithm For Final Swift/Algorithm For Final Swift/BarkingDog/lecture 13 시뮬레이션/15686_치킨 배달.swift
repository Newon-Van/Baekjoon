//
//  15686_치킨 배달.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/23.
//

import Foundation

struct Coordinate: Hashable {
    var y: Int
    var x: Int
}

func findDistance(currentChicken: [Coordinate]) {
    
    var totalDistance = 0
    
    house.forEach { nHouse in
        var distance = N * N
        
        currentChicken.forEach { nChicken in
            distance = min(abs(nHouse.y - nChicken.y) + abs(nHouse.x - nChicken.x), distance)
        }
        totalDistance += distance
    }
    
    result = min(totalDistance, result)
}

func selectedChickenStore(depth: Int, index: Int, target: Int, trace: [Coordinate]) {
    if depth == target {
        return selectedChicken.append(trace)
    }
    
    for i in index ..< chicken.count {
        
        if !visitedSelectedChicken.contains(chicken[i]) {
            var now = trace
            now.append(chicken[i])
            
            visitedSelectedChicken.insert(chicken[i])
            selectedChickenStore(depth: depth + 1, index: i + 1, target: target, trace: now)
            visitedSelectedChicken.remove(chicken[i])
        }
    }
}

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var board = [[Int]]()
var house = Set<Coordinate>()
var chicken = [Coordinate]()
var selectedChicken = [[Coordinate]]()
var visitedSelectedChicken = Set<Coordinate>()
var result = Int.max

for i in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.enumerated().map { j, element in
        let value = Int(String(element))!
        
        switch value {
        case 1: house.insert(Coordinate(y: i, x: j))
        case 2: chicken.append(Coordinate(y: i, x: j))
        default: break
        }
        
        return value
    })
}

for i in 1 ... M {
    selectedChickenStore(depth: 0, index: 0, target: i, trace: [])
}

selectedChicken.forEach {
    findDistance(currentChicken: $0)
}

print(result)

//MARK: - 옛날엔 더 잘 풀었누

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
