//
//  위장.swift
//  Programmers1
//
//  Created by hwangJi on 2022/11/26.
//

import Foundation

@available(macOS 13.0, *)
func solution(_ clothes:[[String]]) -> Int {
    var clothesDict: [String: Int] = [:]
    
    for cloth in clothes {
        if clothesDict[cloth[1]] != nil {
            clothesDict[cloth[1]]! += 1
        } else {
            clothesDict[cloth[1]] = 1
        }
    }
    
    var result = 1
    for i in clothesDict.values {
        result *= (i+1)
    }
    
    return result - 1
}
