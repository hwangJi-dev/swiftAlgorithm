//
//  순위 검색.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/23.
//

import Foundation

var applierDict: [String: [Int]] = [:]
var result: [Int] = []

func solution(_ info:[String], _ query:[String]) -> [Int] {
    for i in info {
        let arr = i.components(separatedBy: .whitespaces)
        
        // 지원자 info를 기반으로 나올 수 있는 조합
        let language = [arr[0], "-"]
        let job = [arr[1], "-"]
        let career = [arr[2], "-"]
        let food = [arr[3], "-"]
        
        for language in language {
            for job in job {
                for career in career {
                    for food in food {
                        let query = "\(language) \(job) \(career) \(food)"
                        
                        // 이미 해당 쿼리가 있다면
                        if applierDict[query] != nil {
                            // value에 점수를 append
                            applierDict[query]?.append(Int(arr[4])!)
                        } else {
                            // value에 점수를 할당
                            applierDict[query] = [Int(arr[4])!]
                        }
                    }
                }
            }
        }
    }
    
    // 점수 순으로 정렬
    for applier in applierDict {
        applierDict[applier.key] = applier.value.sorted()
    }
    
    for query in query {
        let query = query.components(separatedBy: .whitespaces)
        let language = query[0]
        let job = query[2]
        let career = query[4]
        let food = query[6]
        let score = Int(query[7])!
        let queryKey = "\(language) \(job) \(career) \(food)"
        
        // 일치하는 지원자 존재
        if let possibilityScore = applierDict[queryKey] {
            // 이진 탐색으로 score와 possibilityScore 비교
            var start = 0
            var end = possibilityScore.count
            while start < end {
                let mid = (start + end) / 2
                if possibilityScore[mid] >= score {
                    end = mid
                } else {
                    start = mid + 1
                }
            }
            result.append(possibilityScore.count - start)
        } else {
            result.append(0)
        }
    }
    
    return result
}
