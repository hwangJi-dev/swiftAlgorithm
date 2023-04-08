//
//  추억 점수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/08.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var nameYearningDict: [String: Int] = [:]
    var result: [Int] = []
    
    for (idx, i) in name.enumerated() {
        nameYearningDict[i] = yearning[idx]
    }
    
    for p in photo {
        var score = 0
        for j in p {
            if let yearn = nameYearningDict[j] {
                score += yearn
            }
        }
        result.append(score)
    }
    
    return result
}
