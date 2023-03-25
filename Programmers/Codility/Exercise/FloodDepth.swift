//
//  FloodDepth.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/25.
//

import Foundation

public func solution(A : inout [Int]) -> Int {
    var maxWall = A[0]
    var last = A[0]
    var wall = A[0]
    var minLast = 100000000
    var maxDepth = 0
    
    for i in 1..<A.count {
        if A[i] < last {
            minLast = min(minLast, A[i])
        } else {
            // 큰 웅덩이 갱신
            if A[i] >= maxWall {
                maxDepth = max(maxWall - minLast, maxDepth)
                maxWall = A[i]
                minLast = 100000000
            } else {
                // 작은 웅덩이
                wall = A[i]
                maxDepth = max(wall - minLast, maxDepth)
            }
        }
        
        last = A[i]
    }
    
    return maxDepth
}
