//
//  15683_감시.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/17.
//

import Foundation

struct Coordinate: Hashable {
    var y: Int
    var x: Int
}

let directions = [
    Coordinate(y: -1, x: 0),
    Coordinate(y: 0, x: 1),
    Coordinate(y: 1, x: 0),
    Coordinate(y: 0, x: -1)
]

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (input[0], input[1])
var board = [[Int]]()
var cameraLocation = Set<Coordinate>()
var result = N * M

for i in 0 ..< N {
    board.append(readLine()!.split { $0 == " " }.enumerated().map { index, element in
        let value = Int(String(element))!
        if 1 ... 5 ~= value { cameraLocation.insert(Coordinate(y: i, x: index)) }
        return value
    })
}

func checkBlindSpace() {
    var count = 0
    board.forEach {
        count += $0.filter { $0 == 0 }.count
    }
    
    result = min(count, result)
}
func changeCamera() {
    if cameraLocation.isEmpty {
        checkBlindSpace()
        return
    }
    
    let camera = cameraLocation.first!
    
    switch board[camera.y][camera.x] {
    case 1:
        for direct in directions {
            var nowVision = Coordinate(y: direct.y + camera.y, x: direct.x + camera.x)
            var boardChangeLocation = Set<Coordinate>()
            
            while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                if board[nowVision.y][nowVision.x] == 0 {
                    board[nowVision.y][nowVision.x] = -1
                    boardChangeLocation.insert(nowVision)
                }
                
                if board[nowVision.y][nowVision.x] == 6 {
                    break
                }
                
                nowVision.y += direct.y
                nowVision.x += direct.x
            }
            
            cameraLocation.remove(camera)
            changeCamera()
            
            cameraLocation.insert(camera)
            boardChangeLocation.forEach {
                board[$0.y][$0.x] = 0
            }
        }
        
    case 2:
        var boardChangeLocation = Set<Coordinate>()
        var nowVision = Coordinate(y: directions[1].y + camera.y, x: directions[1].x + camera.x)
        
        while 0 ..< M ~= nowVision.x {
            if board[nowVision.y][nowVision.x] == 0 {
                board[nowVision.y][nowVision.x] = -1
                boardChangeLocation.insert(Coordinate(y: nowVision.y, x: nowVision.x))
            }
            if board[nowVision.y][nowVision.x] == 6 {
                break
            }
            
            nowVision.x += directions[1].x
        }
        
        nowVision = Coordinate(y: directions[3].y + camera.y, x: directions[3].x + camera.x)
        
        while 0 ..< M ~= nowVision.x {
            if board[nowVision.y][nowVision.x] == 0 {
                board[nowVision.y][nowVision.x] = -1
                boardChangeLocation.insert(Coordinate(y: nowVision.y, x: nowVision.x))
            }
            if board[nowVision.y][nowVision.x] == 6 {
                break
            }
            
            nowVision.x += directions[3].x
        }
        
        cameraLocation.remove(camera)
        changeCamera()
        
        cameraLocation.insert(camera)
        boardChangeLocation.forEach {
            board[$0.y][$0.x] = 0
        }
        
        nowVision = Coordinate(y: directions[0].y + camera.y, x: directions[0].x + camera.x)
        while 0 ..< N ~= nowVision.y {
            if board[nowVision.y][nowVision.x] == 0 {
                board[nowVision.y][nowVision.x] = -1
                boardChangeLocation.insert(Coordinate(y: nowVision.y, x: nowVision.x))
            }
            if board[nowVision.y][nowVision.x] == 6 {
                break
            }
            
            nowVision.y += directions[0].y
        }
        
        nowVision = Coordinate(y: directions[2].y + camera.y, x: directions[2].x + camera.x)
        
        while 0 ..< N ~= nowVision.y {
            if board[nowVision.y][nowVision.x] == 0 {
                board[nowVision.y][nowVision.x] = -1
                boardChangeLocation.insert(Coordinate(y: nowVision.y, x: nowVision.x))
            }
            if board[nowVision.y][nowVision.x] == 6 {
                break
            }
            
            nowVision.y += directions[2].y
        }
        
        cameraLocation.remove(camera)
        changeCamera()
        cameraLocation.insert(camera)
        boardChangeLocation.forEach {
            board[$0.y][$0.x] = 0
        }
        
    case 3:
        for i in 0 ..< 3 {
            var nowVision = Coordinate(y: directions[i].y + camera.y, x: directions[i].x + camera.x)
            var boardChangeLocation = Set<Coordinate>()
            
            while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                if board[nowVision.y][nowVision.x] == 0 {
                    board[nowVision.y][nowVision.x] = -1
                    boardChangeLocation.insert(nowVision)
                }
                if board[nowVision.y][nowVision.x] == 6 {
                    break
                }
                
                nowVision.y += directions[i].y
                nowVision.x += directions[i].x
            }
            
            if i == 0 {
                var newBoardChangeLocation = Set<Coordinate>()
                
                nowVision = Coordinate(y: directions[3].y + camera.y, x: directions[3].x + camera.x)
                while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                    if board[nowVision.y][nowVision.x] == 0 {
                        board[nowVision.y][nowVision.x] = -1
                        newBoardChangeLocation.insert(nowVision)
                    }
                    if board[nowVision.y][nowVision.x] == 6 {
                        break
                    }
                    
                    nowVision.y += directions[3].y
                    nowVision.x += directions[3].x
                }
                
                cameraLocation.remove(camera)
                changeCamera()
                cameraLocation.insert(camera)
                newBoardChangeLocation.forEach {
                    board[$0.y][$0.x] = 0
                }
            }
            
            nowVision = Coordinate(y: directions[i + 1].y + camera.y, x: directions[i + 1].x + camera.x)
            while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                if board[nowVision.y][nowVision.x] == 0 {
                    board[nowVision.y][nowVision.x] = -1
                    boardChangeLocation.insert(nowVision)
                }
                if board[nowVision.y][nowVision.x] == 6 {
                    break
                }
                
                nowVision.y += directions[i + 1].y
                nowVision.x += directions[i + 1].x
            }
            
            cameraLocation.remove(camera)
            changeCamera()
            cameraLocation.insert(camera)
            boardChangeLocation.forEach {
                board[$0.y][$0.x] = 0
            }
        }
        
        
    case 4:
        for i in 0 ..< 4 {
            var boardChangeLocation = Set<Coordinate>()
            
            for j in 0 ..< 4 {
                if i == j { continue }
                var nowVision = Coordinate(y: directions[j].y + camera.y, x: directions[j].x + camera.x)
                
                while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                    if board[nowVision.y][nowVision.x] == 0 {
                        board[nowVision.y][nowVision.x] = -1
                        boardChangeLocation.insert(nowVision)
                    }
                    if board[nowVision.y][nowVision.x] == 6 {
                        break
                    }
                    
                    nowVision.y += directions[j].y
                    nowVision.x += directions[j].x
                }
            }
            
            cameraLocation.remove(camera)
            changeCamera()
            cameraLocation.insert(camera)
            boardChangeLocation.forEach {
                board[$0.y][$0.x] = 0
            }
        }
        
    case 5:
        var boardChangeLocation = Set<Coordinate>()
        
        for direct in directions {
            var nowVision = Coordinate(y: direct.y + camera.y, x: direct.x + camera.x)
            
            while 0 ..< N ~= nowVision.y && 0 ..< M ~= nowVision.x {
                if board[nowVision.y][nowVision.x] == 0 {
                    board[nowVision.y][nowVision.x] = -1
                    boardChangeLocation.insert(nowVision)
                }
                
                if board[nowVision.y][nowVision.x] == 6 {
                    break
                }
                
                nowVision.y += direct.y
                nowVision.x += direct.x
            }
        }
        
        cameraLocation.remove(camera)
        changeCamera()
        cameraLocation.insert(camera)
        
        boardChangeLocation.forEach {
            board[$0.y][$0.x] = 0
        }
    default: break
    }
    
}

changeCamera()
print(result)

