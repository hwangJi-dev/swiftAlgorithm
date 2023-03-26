//
//  ParityDegree.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/26.
//

import Foundation

public func solution1(N : Int) -> Int {
    var maxPow = 0
    
    for i in 0..<N {
        let p = Int(pow(2.0, Double(i)))
        if N < p { break }
        
        if N % p == 0 {
            maxPow = max(i, maxPow)
        }
    }
    
    return maxPow
}
