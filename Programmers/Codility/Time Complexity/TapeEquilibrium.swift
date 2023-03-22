//
//  TapeEquilibrium.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(D : inout [Int]) -> Int {
    var asum = 0
    var bsum = D.reduce(0, +)
    var minInterval = 1000000000000000000
    
    for i in 0..<D.count - 1 {
        asum += D[i]
        bsum -= D[i]
        minInterval = min(abs(asum - bsum), minInterval)
    }
    
    return minInterval
}
