//
//  OddOccurrencesInArray.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(B : inout [Int]) -> Int {
    var countDict: [Int: Int] = [:]

    for i in B {
        if countDict[i] == nil {
            countDict[i] = 1
        } else {
            countDict[i]! += 1
        }
    }

    return countDict.filter{ $0.value % 2 == 1 }.first!.key
}
