//
//  CountDiv.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/23.
//

import Foundation
public func solution(A : Int, B : Int, K : Int) -> Int {
    if A % K != 0 {
        return (B / K) - (A / K)
    } else {
        return (B / K) - (A / K) + 1
    }
}
