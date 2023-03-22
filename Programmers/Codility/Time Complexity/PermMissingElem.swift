//
//  PermMissingElem.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(C : inout [Int]) -> Int {
    C = C.sorted()
    
    for i in 0..<C.count {
        if i + 1 != C[i] {
            return i + 1
        }
    }
    
    return C.count + 1
}
