//
//  2468_안전영역.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/31.
//

struct Queue<T> {
    private var input:[T] = []
    private var output:[T] = []
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var count: Int { input.count + output.count }
    var peek: T? { input.last ?? output.first }
    
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate {
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1),
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0)
]

func bfs(_ depth: Int, _ start: Coordinate, graph: inout [[Int]]) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)
    graph[start.y][start.x] = 0

    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= N || next.y < 0 || next.y >= N {
                continue
            }
            if graph[next.y][next.x] <= depth {
                continue
            }
            
            queue.enqueue(next)
            graph[next.y][next.x] = 0
        }
    }
}


let N = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var minimum = 100
var result = 1

for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
    minimum = min(graph[i].min()!, minimum)
}

for depth in minimum ... 100 {
    var tempGraph = graph
    var tempResult = 0
    for y in 0 ..< N {
        for x in 0 ..< N {
            if tempGraph[y][x] != 0 && tempGraph[y][x] > depth {
                tempResult += 1
                bfs(depth, Coordinate(x: x, y: y), graph: &tempGraph)
            }
        }
    }
    result = max(tempResult, result)
}

print(result)
