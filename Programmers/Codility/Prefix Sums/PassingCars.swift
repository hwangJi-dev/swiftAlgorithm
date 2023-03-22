//
//  PassingCars.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/23.
//

import Foundation

public func solution3(A : inout [Int]) -> Int {
    var westCarCount = A.filter({ $0 == 1 }).count
    var ans = 0
    
    for a in A {
        if a == 0 {
            ans += westCarCount
        } else {
            westCarCount -= 1
        }
    }
    
    return ans > 1000000000 ? -1 : ans
}
