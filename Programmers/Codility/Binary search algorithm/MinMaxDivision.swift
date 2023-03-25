//
//  MinMaxDivision.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/25.
//

import Foundation

public func solution(K : Int, M : Int, A : inout [Int]) -> Int {
    var low = A.max()!
    var high = A.reduce(0, +)
    
    if K == 1 { return high }
    if K >= A.count { return low }
    
    while low <= high {
        let mid = (low + high) / 2
        
        if isValid(A: A, maxBlockCount: K, maxBlockSize: mid) {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return low
}

func isValid(A: [Int], maxBlockCount: Int, maxBlockSize: Int) -> Bool {
    var blockSum = 0
    var blockCount = 0
    
    for a in A {
        if blockSum + a > maxBlockSize {
            blockSum = a
            blockCount += 1
        } else {
            blockSum += a
        }
        
        if blockCount >= maxBlockCount {
            return false
        }
    }
    
    return true
}
