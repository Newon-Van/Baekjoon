//
//  1012_유기농 배추.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/31.
//

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
    // input.append(12)
    
    // input = [5, 6, 7, 8, 9, 10]
    // output = [4, 3, 2, 1]
    // output.removeLast()
    
    // input = [2,3,4,5]
    
    // 배열의 탐색은 = 1(간혹가다 N) 이 걸립니다.
    // 배열에서 삭제는 N * N 이 걸려요.
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var count: Int { input.count + output.count }
    var peek: T? { input.last ?? output.first }
    
    mutating func enqueue(_ node:T) {
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
    Coordinate(x: 1, y: 0),
]

func bfs(_ start: Coordinate, _ outline: Coordinate, _ graph: inout [[Int]]) {
    var queue = Queue<Coordinate>()
    queue.enqueue(start)

    while !queue.isEmpty {
        let now = queue.dequeue()
        graph[now.y][now.x] = 0
        
        for direct in directions {
            let next = Coordinate(x: now.x + direct.x, y: now.y + direct.y)
            
            if next.x < 0 || next.x >= outline.x || next.y < 0 || next.y >= outline.y {
                continue
            }
            if graph[next.y][next.x] == 0 {
                continue
            }
            
            queue.enqueue(next)
            graph[next.y][next.x] = 0
        }
    }
}

var T = Int(readLine()!)!

repeat {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M, K) = (input[0], input[1], input[2])
    var graph = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    var result = 0
    
    for _ in 0 ..< K {
        
        let cabbageLocation = readLine()!.split(separator: " ").map { Int($0)! }
        let (cabbageY, cabbageX) = (cabbageLocation[0], cabbageLocation[1])
        
        graph[cabbageY][cabbageX] = 1
    }
    
    for i in 0 ..< N {
        for j in 0 ..< M {
            if graph[i][j] == 1 {
                result += 1
                bfs(Coordinate(x: j, y: i), Coordinate(x: M, y: N), &graph)
            }
        }
    }
    
    print(result)
    T -= 1
} while T > 0
