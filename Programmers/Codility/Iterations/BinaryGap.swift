//
//  BinaryGap.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

@available(macOS 13.0, *)
public func solution(N : Int) -> Int {
    let binaryN = String(N, radix: 2)
    var maxCnt = 0
    var temp = 0
    
    if !binaryN.contains("1") { return 0 }

    for i in binaryN {
        if i == "1" {
            maxCnt = max(maxCnt, temp)
            temp = 0
        } else {
            temp += 1
        }
    }
    
    return maxCnt
}
