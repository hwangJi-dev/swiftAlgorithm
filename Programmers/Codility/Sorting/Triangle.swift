//
//  Triangle.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution7(_ A : inout [Int]) -> Int {
    A = A.sorted()
    A = A.filter({ $0 > 0 })
    
    if A.count < 3 { return 0 }
    
    for i in 2..<A.count {
        if A[i - 2] + A[i - 1] > A[i] {
            return 1
        }
    }
    
    return 0
}
