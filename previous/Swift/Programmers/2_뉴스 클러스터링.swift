//
//  2_뉴스 클러스터링.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/07.
//

func solution(_ str1:String, _ str2:String) -> Int {
    
    var result = 1
    var first = [String]()
    var interSection = Set<Int>()
    var union = 0
    
    var temp = Array(str1.lowercased())
    for i in stride(from: 0, to: temp.count - 1, by: +1) {
        first += [String(temp[i]) + String(temp[i + 1])]
    }
    
    var second = [String]()
    temp = Array(str2.lowercased())
    for i in stride(from: 0, to: temp.count - 1, by: +1) {
        second += [String(temp[i]) + String(temp[i + 1])]
    }
    first = first.filter {
        var temp = Array($0)
        return temp[0] >= "a" && temp[0] <= "z" && temp[1] >= "a" && temp[1] <= "z"
    }
    second = second.filter {
        let temp = Array($0)
        return temp[0] >= "a" && temp[0] <= "z" && temp[1] >= "a" && temp[1] <= "z"
    }
    
    print(first)
    print(second)
    
    for i in 0 ..< first.count {
        for j in 0 ..< second.count {
            if first[i] == second[j] {
                interSection.insert(i)
                second[j] = "--"
                break
            }
        }
    }
    
    union = first.count + second.count - interSection.count
    print(interSection.count, union)
    
    if interSection.count == 0 && union == 0 {
        result = 65536
    } else {
        result = Int((Float(interSection.count) / Float(union)) * 65536)
    }
    
    return result
}
