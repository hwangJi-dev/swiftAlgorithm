//
//  혼자 놀기의 달인.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/02.
//

import Foundation

func solution(cards:[Int]) -> Int {
    var cardDict: [Int: Int] = [:]
    
    for (idx, i) in cards.enumerated() {
        cardDict[idx + 1] = i
    }
    
    var ans: [Int] = []
    
    func cycle(_ start: Int) -> Int {
        var queue: [Int] = []
        var start = start
        
        while cardDict[start] != nil {
            let next = cardDict[start]!
            queue.append(start)
            cardDict.removeValue(forKey: start)
            start = next
        }
        
        return queue.count
    }
    
    while !cardDict.isEmpty {
        ans.append(cycle(cardDict.keys.first!))
    }

    ans = ans.sorted(by: >)
    
    return ans.count >= 2 ? ans[0] * ans[1] : 0
}
