//
//  10709_기상캐스터.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/09.
//

struct Coordinate {
    var x: Int
    var y: Int
    var time: Int
}

func solve(_ start: Coordinate) {
    graph[start.y][start.x] = "0"
    var time = start.time
    
    for i in start.x ... W - 1 {
        if graph[start.y][i] == "c" {
            return
        }
        
        if Int(graph[start.y][i]) ?? Int.max > time  {
            graph[start.y][i] = String(time)
        }
        time += 1
    }
    
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (H, W) = (input[0], input[1])

var graph = [[String]](repeating: [String](repeating: ".", count: W), count: H)
(0 ... H - 1).forEach {
    graph[$0] = readLine()!.map { String($0) }
}

for y in 0 ... H - 1 {
    for x in 0 ... W - 1 {
        if graph[y][x] == "c" {
            solve(Coordinate(x: x, y: y, time: 0))
        }
    }
}

graph.forEach {
    $0.compactMap { item in
        String(Int(item) ?? -1)
    }
    .forEach {
        print($0, terminator: " ")
    }
    print()
}
