//
//  14502_연구소.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/03/07.
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
    var x: Int
    var y: Int
}

let directions = [
    Coordinate(x: -1, y: 0),
    Coordinate(x: 1, y: 0),
    Coordinate(x: 0, y: -1),
    Coordinate(x: 0, y: 1)
]


func bfs() {
    var queue = Queue<Coordinate>()
    var tempSafeZone = safeZone
    var tempGraph = graph
    virusZone.forEach {
        queue.enqueue($0)
    }
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= M || next.y < 0 || next.y >= N {
                continue
            }
            
            if tempGraph[next.y][next.x] != 0 {
                continue
            }
            
            tempGraph[next.y][next.x] = 2
            queue.enqueue(next)
            tempSafeZone -= 1
            
            if tempSafeZone < result {
                return
            }
        }
    }
    
    result = max(result, tempSafeZone)
}

func dfs(depth: Int, n: Int) {
    if depth == 3 {
        bfs()
        return
    }
    
    for i in n ..< N {
        for j in 0 ..< M {
            if graph[i][j] == 0 {
                graph[i][j] = 1
                dfs(depth: depth + 1, n: i)
                graph[i][j] = 0
            }
        }
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
var virusZone = [Coordinate]()

var safeZone = (N * M) - 3
var result = 0

for i in 0 ..< N {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0 ..< M {
        if graph[i][j] == 2 {
            virusZone.append(Coordinate(x: j, y: i))
            safeZone -= 1
        }
        if graph[i][j] == 1 {
            safeZone -= 1
        }
    }
}

dfs(depth: 0, n: 0)
print(result)
