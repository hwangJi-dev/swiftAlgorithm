//
//  StoneWall.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution(H : inout [Int]) -> Int {
    var stack: [Int] = []
    var cnt = 0
    
    for h in H {
        while !stack.isEmpty && stack[stack.count - 1] > h {
            stack.popLast()
        }
        
        if stack.isEmpty || stack[stack.count - 1] < h {
            stack.append(h)
            cnt += 1
        }
    }
    
    return cnt
}
