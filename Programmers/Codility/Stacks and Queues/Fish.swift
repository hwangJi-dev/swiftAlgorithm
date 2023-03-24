//
//  Fish.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution(A : inout [Int], B : inout [Int]) -> Int {
    var stack: [Int] = []
    var fish0Count = 0
    
    for i in 0..<A.count {
        if B[i] == 1 {
            stack.append(A[i])
        } else {
            if stack.isEmpty {
                fish0Count += 1
            } else {
                for _ in 0..<stack.count {
                    let pop = stack.popLast() ?? -1
                    if A[i] < pop {
                        stack.append(pop)
                        break
                    }
                }
                
                if stack.count == 0 {
                    fish0Count += 1
                }
            }
        }
    }
    
    return fish0Count + stack.count
}
