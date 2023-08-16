import Foundation

func pass() {
    for i in 0 ..< N {
        
        for j in 0 ..< N - 1 {
            
            if board[i][j] != board[i][j + 1] {
                
                guard 0 <= j + 1 - L else { continue }
                
                var tempValue = 0
                
                
            }
        }
        
    }
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, L) = (input[0], input[1])
var board = [[Int]]()
var result = 0

for _ in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}
