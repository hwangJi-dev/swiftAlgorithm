//
//  신고 결과 받기_re.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/23.
//

import Foundation
func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var report_list: [String: [String]] = [:]
    var reported_list: [String: Int] = [:]
    var result: [Int] = []
    
    for id_report in Set(report) {
        let list = id_report.components(separatedBy: .whitespaces)
        report_list[list[0]] = report_list[list[0]] != nil ? report_list[list[0]]! + [list[1]] : [list[1]]
        reported_list[list[1]] = reported_list[list[1]] != nil ? reported_list[list[1]]! + 1 : 1
    }
    
    id_list.forEach {
        result.append(report_list[$0] != nil ? (report_list[$0]?.filter({ reported_list[$0]! >= k }).count)! : 0)
    }
    
    return result
}
