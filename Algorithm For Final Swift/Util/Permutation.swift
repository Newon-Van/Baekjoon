//
//  Permutation.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/28.
//

import Foundation

func permutation<T> (_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)
    
    func permute(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0 ..< elements.count {
            guard !visited[i] else { continue }
            visited[i] = true
            permute(now + [elements[i]])
            visited[i] = false
        }
    }
    
    permute([])
    return result
}
