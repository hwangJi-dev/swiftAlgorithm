//
//  PermCheck.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution1(A : inout [Int]) -> Int {
    A = A.sorted(by: >)
    return Set(A).count == A.count && A.count == A.first! ? 1 : 0
}
