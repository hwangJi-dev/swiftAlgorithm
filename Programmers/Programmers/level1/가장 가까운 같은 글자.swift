//
//  가장 가까운 같은 글자.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/13.
//

import Foundation

func solution1(_ s:String) -> [Int] {
    var wordIndexDict: [String: Int] = [:]
    var result: [Int] = []
    
    for (index, i) in s.enumerated() {
        let word = String(i)
        
        if wordIndexDict[word] != nil {
            result.append(index - wordIndexDict[word]!)
        } else {
            result.append(-1)
        }
        
        wordIndexDict[word] = index
    }
    
    return result
}
