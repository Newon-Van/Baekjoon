//
//  test.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/13.
//

//import Foundation
//
//var Tcase = Int(readLine()!)!
//var visit: [Bool] = []
//var done: [Bool] = [] //cycle을 거친 node인지(팀 매칭을 거친 노드인지)
//var cnt = 0
//
//func dfs(_ arr:[Int], cur: Int) {
//    var nextNode = arr[cur]
//    visit[cur] = true
//    
//    if !visit[nextNode] {
//        dfs(arr, cur: nextNode)
//    }else {
//        if !done[nextNode] { // cycle이 되었는데 아직 팀 매칭 되지 않았다면
//            while nextNode != cur { // 친구들 저장
//                cnt += 1
//                nextNode = arr[nextNode]
//            }
//            cnt += 1 // cur 자기 카운드
//        }
//    }
//    
//    done[cur] = true
//}
//
//for _ in 0 ..< Tcase {
//    let n = Int(readLine()!)!
//    var arr = readLine()!.split(separator: " ").map{ Int($0)!}
//    arr.insert(0, at: 0) //의미 없는 수
//    cnt = 0
//    
//    visit = Array(repeating: false, count: n+1)
//    done = Array(repeating: false, count: n+1)
//    
//    for i in arr {
//        if !visit[i] {
//            dfs(arr, cur: i)
//        }
//    }
//    print(arr.count - cnt)
//}
