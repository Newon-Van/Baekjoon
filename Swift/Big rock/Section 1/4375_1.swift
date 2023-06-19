//
//  4375_1.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/27.
//

while let input = Int(readLine() ?? "End") {
    var temp = 1
    var result = 1
    
    while true {
        if (temp % input == 0) {
            print("------")
            print(result)
            break;
        }
        
        temp = (temp * 10) + 1
        temp %= input
        
        print(temp)
        
        result += 1
    }
}
