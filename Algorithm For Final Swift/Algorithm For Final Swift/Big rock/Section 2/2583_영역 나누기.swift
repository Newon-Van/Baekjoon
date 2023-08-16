//
//  2583_영역 나누기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/31.
//

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var count: Int { input.count + output.count }
    
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeFirst()
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

func drawSquare(_ graph: inout [[Int]],_ start: Coordinate, _ end: Coordinate) {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
    
    queue.enqueue(start)
    graph[start.y][start.x] = 1
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()
                
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= N || next.y < 0 || next.y >= M {
                continue
            }
            
            if visited[next.y][next.x] {
                continue
            }
            
            if next.x < start.x || next.x > end.x || next.y > start.y || next.y < end.y {
                continue
            }
            
            graph[next.y][next.x] = 1
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    graph.forEach {
        print($0)
    }
    print("-------")
}

func bfs(_ graph: inout [[Int]], _ start: Coordinate) -> Int {
    var queue = Queue<Coordinate>()
    var zoneCounter = 1
    
    queue.enqueue(start)
    graph[start.y][start.x] = 1
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= N || next.y < 0 || next.y >= M {
                continue
            }
            
            if graph[next.y][next.x] == 1{
                continue
            }
            
            queue.enqueue(next)
            graph[next.y][next.x] = 1
            zoneCounter += 1
        }
    }
    
    return zoneCounter
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N, K) = (input[0], input[1], input[2])
var graph = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
var result = 0
var resultArray = [Int]()

for _ in 0 ..< K {
    let zone = readLine()!.split(separator: " ").map { Int($0)! }
    let BottomLeft = Coordinate(x: zone[0], y: M - zone[1] - 1)
    let TopRight = Coordinate(x: zone[2] - 1, y: M - zone[3])

    drawSquare(&graph, BottomLeft, TopRight)
}

for x in 0 ..< N {
    for y in 0 ..< M {
        if graph[y][x] == 0 {
            result += 1
            resultArray.append(bfs(&graph, Coordinate(x: x, y: y)))
        }
    }
}

print(result)
resultArray.sorted().forEach {
    print($0, terminator: " ")
}
