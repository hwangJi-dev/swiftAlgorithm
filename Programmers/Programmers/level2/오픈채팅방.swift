//
//  오픈채팅방.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/24.
//

import Foundation

func solution1(_ record:[String]) -> [String] {
    var uidDict: [String: String] = [:]
    var result: [String] = []
    
    for i in record {
        let rec = i.components(separatedBy: .whitespaces)
        if rec[0] != "Leave" {
            uidDict[rec[1]] = rec[2]
        }
    }
    
    record.forEach {
        let rec = $0.components(separatedBy: .whitespaces)
        if rec[0] != "Change" {
            result.append("\(uidDict[rec[1]]!)님이 " + (rec[0] == "Enter" ? "들어왔습니다." : "나갔습니다."))
        }
    }
    
    return result
}
