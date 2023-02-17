//
//  귤 고르기.swift
//  Programmers1
//
//  Created by hwangJi on 2022/11/25.
//

import Foundation

@available(macOS 13.0, *)
func solution(k:Int, tangerine:[Int]) -> Int {
    var tangerineDict: [Int: Int] = [:]

    for i in tangerine {
        if tangerineDict[i] != nil {
            tangerineDict[i]! += 1
        } else {
            tangerineDict[i] = 1
        }
    }
    
    let sortedDitionary = tangerineDict.sorted { $0.1 > $1.1 }
    var sortedTangerine: [Int] = []
    for element in sortedDitionary {
        for _ in 1...element.value {
            sortedTangerine.append(element.key)
        }
    }
    
    let sliceTangerine = sortedTangerine[0..<k]
    return Set(sliceTangerine).count
}
