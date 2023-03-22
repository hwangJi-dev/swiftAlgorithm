//
//  FrogRiverOne.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(X : Int, A : inout [Int]) -> Int {
    var leafArr: Set<Int> = []
    
    for (idx, i) in A.enumerated() {
        leafArr.insert(i)
        if leafArr.count == X { return idx }
    }
    
    return -1
}
