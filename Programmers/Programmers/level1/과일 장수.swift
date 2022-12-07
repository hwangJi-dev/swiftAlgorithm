//
//  과일 장수.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/07.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    // 1. score 내림차순 정렬
    var score = score.sorted(by: >)
    var sum = 0
    
    // 2. stride로 배열 순회 (k 개수만큼)
    // 3. 해당 값 * m 을 sum에 더하기
    if score.count != m {
        for i in stride(from: m - 1, to: score.count, by: m) {
            sum += score[i] * m
        }
    } else {
        sum += score[score.count - 1] * m
    }
    
    return sum
}
