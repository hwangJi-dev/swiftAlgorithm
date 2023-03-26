//
//  FirstUnique.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/26.
//

import Foundation

public func solution5(A : inout [Int]) -> Int {
    var dict: [Int: (Int, Int)] = [:]
    
    if A.count == 1 { return A.first! }
    if A.count == 0 { return -1 }
    
    for (index, i) in A.enumerated() {
        if dict[i] == nil {
            dict[i] = (index, 1)
        } else {
            dict[i]!.1 += 1
        }
    }
    
    dict = dict.filter({ $0.value.1 == 1 })
    return dict.sorted(by: { $0.value.0 < $1.value.0 }).first?.key ?? -1
}
