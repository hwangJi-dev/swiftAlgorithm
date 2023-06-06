//
//  인사고과.swift
//  Programmers1
//
//  Created by hwangJi on 2023/06/06.
//

import Foundation

func solution(scores:[[Int]]) -> Int {
    let wanhoScore = scores[0]
    let sum = wanhoScore[0] + wanhoScore[1]
    let scoreArr = scores.sorted(by: { $0[0] > $1[0] || ($0[0] == $1[0] && $0[1] < $1[1]) })
    var rank = 1
    var colleagueScoreMax = 0
    
    for i in scoreArr {
        // 완호가 인센티브를 받지 못하는 경우
        if wanhoScore[0] < i[0] && wanhoScore[1] < i[1] {
            return -1
        }
        
        // 0번은 내림차순으로 내려가므로 1번 점수가(동료점수) 크거나 같을 경우에만 두 점수가 모두 낮지 않음을 의미함
        if colleagueScoreMax <= i[1] {
            // 완호의 점수보다 더 높다면 상위에 위치한 것이므로 rank + 1
            if sum < i[0] + i[1] {
                rank += 1
            }
            
            colleagueScoreMax = i[1]
        }
    }
    
    return rank
}
