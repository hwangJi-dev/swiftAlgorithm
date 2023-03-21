//
//  CyclicRotation.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(A: inout [Int], K: Int) -> [Int] {
    if A.isEmpty { return [] }
    
    for _ in 0..<K {
        A.insert(A.removeLast(), at: 0)
    }
    
    return A
}
