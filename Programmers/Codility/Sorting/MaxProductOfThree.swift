//
//  MaxProductOfThree.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/24.
//

import Foundation

public func solution6(_ A : inout [Int]) -> Int {
    A = A.sorted()
    let containMinusMaxValue = A[0] * A[1] * A[A.count - 1]
    let MaxValue = A[A.count - 3] * A[A.count - 2] * A[A.count - 1]
    return containMinusMaxValue > MaxValue ? containMinusMaxValue : MaxValue
}
