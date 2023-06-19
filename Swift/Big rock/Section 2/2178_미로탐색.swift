//
//  temp.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/28.
//


var n = 0, m = 0
var graph = [[Int]]()
var ans = [Int](repeating: 0, count: 10001)

func dfs(_ node: Int, _ tempBoard: inout [Int]) -> Int {
    tempBoard[node] = 1
    
    for neighbor in graph[node] {
        if tempBoard[neighbor] == 0 {
            tempBoard[node] += dfs(neighbor, &tempBoard)
        }
    }
    
    return tempBoard[node]
}


func main() {
    let input = readLine()!.split(separator: " ")
    n = Int(input[0])!
    m = Int(input[1])!
    graph = [[Int]](repeating: [Int](), count: 10001)
    
    for _ in 0 ..< m {
        let edge = readLine()!.split(separator: " ")
        let from = Int(edge[0])!
        let to = Int(edge[1])!
        graph[to].append(from)
    }
    
    for i in 1...n {
        var tempBoard = [Int](repeating: 0, count: 10001)
        ans[i] = max(dfs(i, &tempBoard), ans[i])
    }
    
    
    let maxCount = ans.max()
    
    
    for i in 1...n {
        if ans[i] == maxCount {
            print(i, terminator: " ")
        }
    }
}

main()
