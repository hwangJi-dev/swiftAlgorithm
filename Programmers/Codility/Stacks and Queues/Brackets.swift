//
//  Brackets.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution(S : inout String) -> Int {
    let pairBracket: [Character: Character] = ["}": "{", ")": "(", "]": "["]
    var stack: [Character] = []
    
    for s in S {
        switch s {
        case "}", "]", ")":
            let lastChar = stack.popLast()
            if lastChar != pairBracket[s] { return 0 }
        default:
            stack.append(s)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}
