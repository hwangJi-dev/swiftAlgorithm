//
//  성격 유형 검사하기_re.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/20.
//

import Foundation

func solution2(_ survey:[String], _ choices:[Int]) -> String {
    let personality: [String] = ["RT", "CF", "JM", "AN"]
    var personalityScore: [Int] = [0, 0, 0, 0]
    var result: String = ""
    
    for (index, i) in survey.enumerated() {
        let type = String(choices[index] < 4 ? i.first! : i.last!)
        for (idx, j) in personality.enumerated() {
            if j.contains(type) {
                personalityScore[idx] += type == String(j.first!) ? -calScore(choices[index]) : calScore(choices[index])
            }
        }
    }
    
    for (index, score) in personalityScore.enumerated() {
        result += score <= 0 ? String(personality[index].first!) : String(personality[index].last!)
    }
    
    return result
}

func calScore(_ score: Int) -> Int {
    return abs(score - 4)
}
