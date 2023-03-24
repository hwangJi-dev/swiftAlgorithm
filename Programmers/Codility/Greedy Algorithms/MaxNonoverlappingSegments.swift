//
//  MaxNonoverlappingSegments.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/25.
//

import Foundation

public func solution1(A : inout [Int], B : inout [Int]) -> Int {
    if A.isEmpty { return 0 }
    
    var end = B[0]
    var cnt = 1
    
    for i in 1..<A.count {
        if A[i] > end {
            cnt += 1
            end = B[i]
        }
    }
    
    return cnt
}
