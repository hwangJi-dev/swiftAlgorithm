//
//  보석 쇼핑.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/28.
//

import Foundation

func solution(gems:[String]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    var minDistance = Int.max
    var collectedGems: [String: Int] = [:]
    var ans: [Int] = []
    let gemCnt = Set(gems).count
    
    while leftIdx <= rightIdx && rightIdx < gems.count {
        if collectedGems[gems[leftIdx]] == nil {
            collectedGems[gems[leftIdx]] = 0
            continue
        }
        
        if collectedGems.count == gemCnt {
            if minDistance > rightIdx - leftIdx {
                minDistance = rightIdx - leftIdx
                ans = [leftIdx + 1, rightIdx + 1]
            }
            
            collectedGems[gems[leftIdx]]! -= 1
            
            if collectedGems[gems[leftIdx]] == 0 {
                collectedGems[gems[leftIdx]] = nil
            }
            leftIdx += 1
        } else {
            if collectedGems[gems[rightIdx]] == nil {
                collectedGems[gems[rightIdx]] = 0
            } else {
                collectedGems[gems[rightIdx]]! += 1
                rightIdx += 1
            }
        }
    }
    
    return ans
}
