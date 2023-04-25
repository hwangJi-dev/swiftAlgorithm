//
//  10814_나이순 정렬.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/26.
//

import Foundation

func solution10814() {
    let n = Int(readLine()!)!
    var ojDict: [Int: [String]] = [:]
    
    for _ in 1...n {
        let o = readLine()!.components(separatedBy: .whitespaces)
        let age = Int(o[0])!
        
        if ojDict[age] == nil {
            ojDict[age] = [o[1]]
        } else {
            ojDict[age]?.append(o[1])
        }
    }
    
    for i in ojDict.sorted(by: { $0.key < $1.key }) {
        for j in i.value {
            print("\(i.key) \(j)")
        }
    }
}
