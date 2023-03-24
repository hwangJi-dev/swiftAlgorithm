//
//  Nesting.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution1(S : inout String) -> Int {
    var stack: [Character] = []
    
    for i in S {
        if i == "(" {
            stack.append(i)
        } else {
            if stack.isEmpty {
                return 0
            } else {
                stack.popLast()
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}
