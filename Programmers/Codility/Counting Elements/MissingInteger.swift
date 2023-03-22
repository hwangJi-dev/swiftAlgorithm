//
//  MissingInteger.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/23.
//

import Foundation

public func solution2(A : inout [Int]) -> Int {
    A = A.sorted()
    A = A.filter({ $0 >= 1 })
    
    if A.isEmpty { return 1 }
    
    var preInteger = 0
    
    for i in A {
        if i - preInteger > 1 {
            return preInteger + 1
        } else {
            preInteger = i
        }
    }
    
    return Set(A).count + 1
}
