//
//  Permutation.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/30.
//

import Foundation

func combination(depth: Int, result: [Int]){
    if depth == K {
        candidateList.append(result)
        return
    }
    
    var temp = result
    for i in 0 ..< numberList.count {
        if temp.contains(numberList[i]) {
            continue
        }
        
        temp.append(numberList[i])
        combination(depth: depth + 1, result: temp)
        temp.removeLast()
    }
}

combination(depth: -1, result: [Int]())


func permutation(depth: Int, result: [Int]){
    if result.count == 3 {
        indexList.append(result)
        return
    }
    
    var temp = result
    
    for i in 0 ..< test.count {
        if temp.contains(i) {
            continue
        }
        
        temp.append(i)
        permutation(depth: i + 1, result: temp)
        temp.removeLast()
    }
}

permutation(depth: 0, result: [Int]())
