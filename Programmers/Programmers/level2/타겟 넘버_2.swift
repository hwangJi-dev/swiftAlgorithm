//
//  타겟 넘버_2.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/30.
//

import Foundation

var targetMadeCount = 0

func solution2(numbers:[Int], target:Int) -> Int {
    dfsToFindTargetNumber(0, target, numbers, 0)
    return targetMadeCount
}

func dfsToFindTargetNumber(_ sum: Int, _ target: Int, _ numbers: [Int], _ idx: Int) {
    if idx == numbers.count {
        if sum == target {
            targetMadeCount += 1
        }
        
        return
    }
    
    dfsToFindTargetNumber(sum + numbers[idx], target, numbers, idx + 1)
    dfsToFindTargetNumber(sum - numbers[idx], target, numbers, idx + 1)
}
