//
//  MaxCounters.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(N : Int, A : inout [Int]) -> [Int] {
    var counter = Array(repeating: 0, count: N)
    var maxCounter = 0
    var maxCounterValue = 0
    
    for a in A {
        if a == N + 1 {
            maxCounterValue = maxCounter
        } else {
            if counter[a - 1] < maxCounterValue {
                counter[a - 1] = maxCounterValue
            }
            
            counter[a - 1] += 1
            
            if maxCounter < counter[a - 1] {
                maxCounter = counter[a - 1]
            }
        }
    }
    
    for i in 0..<counter.count {
        if counter[i] < maxCounterValue {
            counter[i] = maxCounterValue
        }
    }
    
    return counter
}
