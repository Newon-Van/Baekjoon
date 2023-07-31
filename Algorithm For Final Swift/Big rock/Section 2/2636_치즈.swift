//
//  2636_치즈.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/08.
//

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    var count: Int {
        input.count + output.count
    }
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
    var y: Int
    var x: Int
    var time: Int
}

let directions = [
    Coordinate(y: 0, x: -1, time: 0),
    Coordinate(y: 0, x: 1, time: 0),
    Coordinate(y: -1, x: 0, time: 0),
    Coordinate(y: 1, x: 0, time: 0)
]

func bfs() -> Bool {
    var queue = Queue<Coordinate>()
    queue.enqueue(Coordinate(y: 0, x: 0, time: 0))
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var lastCheeze = 0
    var isLast = true
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        if graph[now.y][now.x] == 2 {
            graph[now.y][now.x] = 0
            continue
        }
        
        for direct in directions {
            let next = Coordinate(y: now.y + direct.y, x: now.x + direct.x, time: now.time + 1)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            
            if graph[next.y][next.x] == 1 {
                graph[next.y][next.x] = 2
                lastCheeze += 1
                isLast = false
            }
            
            if visited[next.y][next.x] {
                continue
            }
            
            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }

    if lastCheeze != 0 {
        resultCheeze = lastCheeze
    }
    
    return isLast
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
var resultCheeze = 0
var resultTime = 0

while bfs() == false {
    resultTime += 1
}

print(resultTime)
print(resultCheeze)
