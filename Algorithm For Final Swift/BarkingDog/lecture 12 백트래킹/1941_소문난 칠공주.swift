//
//  1941_소문난 칠공주.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/16.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
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
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1)
]

func combi() -> [[Int]] {
    let array = [Int](0 ... 24)
    var combiArr = [[Int]]()
    
    func dfs(index: Int, trace: [Int]) {
        if trace.count == 7 {
            combiArr.append(trace)
            return
        }
        
        for i in index ..< array.count {
            dfs(index: i + 1, trace: trace + [array[i]])
        }
    }
    
    dfs(index: 0, trace: [])
    return combiArr
}

func checkS(arr: [Int]) -> Bool {
    var count = 0
    
    for student in arr {
        let x = student / 5
        let y = student % 5
        
        if board[y][x] == "S" { count += 1 }
    }
    
    return count >= 4
}

func checkConnection(array: [Int]) -> Bool {
    var queue = Queue<Int>()
    queue.enqueue(array[0])
    var visited = Set<Int>()
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        let nowX = now / 5
        let nowY = now % 5
        
        for direct in directions {
            let next = Coordinate(y: direct.y + nowY, x: direct.x + nowX)
            let nextValue = next.x * 5 + next.y
            
            guard 0 ..< 5 ~= next.x && 0 ..< 5 ~= next.y else { continue }
            guard array.contains(nextValue) && !visited.contains(nextValue) else { continue }
            
            visited.insert(nextValue)
            queue.enqueue(nextValue)
        }
    }
    
    return visited.count == 7
}

var board = [[String]]()
var result = 0

for _ in 0 ..< 5 {
    board.append(readLine()!.map { String($0) })
}

let array = combi()
var answer = 0

for element in array {
    if checkS(arr: element) && checkConnection(array: element) {
        result += 1
    }
}

print(result)
