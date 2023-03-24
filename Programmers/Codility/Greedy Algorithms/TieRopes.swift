//
//  TieRopes.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/25.
//

import Foundation

public func solution(K : Int, A : inout [Int]) -> Int {
    var sum = 0
    var cnt = 0
    
    for i in A {
        sum += i
        
        if sum >= K {
            cnt += 1
            sum = 0
        }
    }
    
    return cnt
}
