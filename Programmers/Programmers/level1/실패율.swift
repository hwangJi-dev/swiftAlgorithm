//
//  실패율.swift
//  Programmers1
//
//  Created by hwangJi on 2022/10/11.
//

import Foundation

func solution(N:Int, stages:[Int]) -> [Int] {
    var stageDict: [Int: Int] = [:]

    for i in 1...N {
        stageDict[i] = 0
    }
    
    for i in stages {
        stageDict[i] = stageDict[i] != nil ?  stageDict[i]! + 1 : 1
    }
    
    var stageCount = stages.count
    var failureDict: [Int: Double] = [:]
    
    for i in stageDict.keys.filter({ $0 <= N }).sorted() {
        failureDict[i] = Double(stageDict[i]!)/Double(stageCount)
        stageCount -= stageDict[i]!
    }
    
    var sortedDict = failureDict.sorted { $0.key < $1.key }
    sortedDict = sortedDict.sorted { $0.value > $1.value }
    
    return sortedDict.map { $0.key }
}
