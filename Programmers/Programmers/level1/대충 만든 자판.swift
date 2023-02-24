//
//  대충 만든 자판.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/24.
//

import Foundation

func solution(keymap:[String], targets:[String]) -> [Int] {
    var keyDict: [String: Int] = [:]
    var result: [Int] = []
    
    for key in keymap {
        for (idx, k) in key.enumerated() {
            if keyDict[String(k)] == nil {
                keyDict[String(k)] = idx + 1
            } else {
                keyDict[String(k)] = keyDict[String(k)]! > idx + 1 ? idx + 1 : keyDict[String(k)]!
            }
        }
    }
    
    for target in targets {
        var ans = 0
        for t in target {
            if keyDict[String(t)] == nil {
                ans = -1
                break
            } else {
                ans += keyDict[String(t)]!
            }
        }
        result.append(ans)
    }
    
    return result
}
