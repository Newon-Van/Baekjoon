//
//  3_3179_백조의호수_이왜시간초과.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/01.
//

struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    var count : Int {
        return input.count + output.count
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate : Hashable, Equatable {
    let y: Int
    let x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1),
    Coordinate(y: 0, x: 1),
]

func goSwan() -> Bool {
    
    var newSwanQueue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)

    
    while !swanQueue.isEmpty {
        let now = swanQueue.dequeue()
        visited[now.y][now.x] = true
        
        for d in directions {
            let next = Coordinate(y: now.y + d.y, x: now.x + d.x)
            
            if next.y < 0 || next.x < 0 || next.y >= R || next.x >= C {
                continue
            }
            
            if graph[next.y][next.x] == "X" {
                newSwanQueue.enqueue(next)
                continue
            } else if visited[next.y][next.x] {
                continue
            }
            
            if next.y == swanList[1].y && next.x == swanList[1].x {
                return true
            }
            
            swanQueue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    swanQueue = newSwanQueue
    return false
}

func spreadWater() -> Int {
    var time = 0

    while goSwan() == false {
        time += 1
        var newWaterSet = Set<Coordinate>()
        
        while !waterQueue.isEmpty {
            let now = waterQueue.dequeue()
            
            for d in directions {
                let next = Coordinate(y: now.y + d.y, x: now.x + d.x)
                
                if next.y < 0 || next.x < 0 || next.y >= R || next.x >= C {
                    continue
                }
                
                if graph[next.y][next.x] == "P" {
                    continue
                } else if graph[next.y][next.x] == "L" {
                    continue
                }
                
                if graph[next.y][next.x] == "X" {
                    newWaterSet.insert(next)
                    continue
                }
                
                waterQueue.enqueue(next)
                graph[next.y][next.x] = "P"
            }
        }
        newWaterSet.forEach { water in
            graph[water.y][water.x] = "."
            waterQueue.enqueue(water)
        }
        newWaterSet.removeAll()
    }
    
    return time
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (R, C) = (input[0], input[1])
var graph = [[String]](repeating: [String](repeating: " ", count: C), count: R)
var swanList = [Coordinate]()
var waterQueue = Queue<Coordinate>()
var swanQueue = Queue<Coordinate>()

for i in 0 ..< R {
    graph[i] = readLine()!.map{ String($0) }
    for j in 0 ..< C {
        if graph[i][j] == "L" {
            swanList.append(Coordinate(y: i, x: j))
        } else if graph[i][j] == "." {
            waterQueue.enqueue(Coordinate(y: i, x: j))
        }
    }
}
swanQueue.enqueue(swanList[0])
print(spreadWater())
