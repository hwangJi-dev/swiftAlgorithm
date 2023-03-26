//
//  SrtSymmetryPoint.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/26.
//

import Foundation

public func solution(_ S : inout String) -> Int {
    if S.count % 2 == 0 { return -1 }
    
    let mid = S.count / 2
    var start = 0
    var end = S.count - 1
    let s = Array(S).map({ String($0) })
    
    while start < mid {
        if s[start] != s[end] {
            return -1
        }
        
        start += 1
        end -= 1
    }
    
    return mid
}
