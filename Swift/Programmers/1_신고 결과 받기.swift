//
//  1_신고 결과 받기.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/24.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportedHistory = [String:Int]()
    var pushNotificationToWhom = [String:[String]]()
    var pushNotificationFinal = [String: Int]()
    var result = [Int]()
    
    id_list.forEach {
        reportedHistory[$0] = 0
        pushNotificationToWhom[$0] = [String]()
        pushNotificationFinal[$0] = 0
    }
    
    report.forEach{ id in
        let input = id.split(separator: " ")
        let reporter = String(input[0])
        let reported = String(input[1])
        
        if !pushNotificationToWhom[reporter]!.contains(reported) {
            reportedHistory[reported]! += 1
            pushNotificationToWhom[reporter]!.append(reported)
        }
    }
    
    reportedHistory = reportedHistory.filter { reported in
        reported.value >= k
    }
    
    pushNotificationToWhom.forEach { reporter, reporteds in
        reporteds.forEach { reported in
            if reportedHistory.keys.contains(reported) {
                pushNotificationFinal[reporter]! += 1
            }
        }
    }
    
    id_list.forEach { id in
        result.append(pushNotificationFinal[id]!)
    }
    
    return result
}
