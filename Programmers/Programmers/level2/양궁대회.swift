//
//  양궁대회.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/22.
//

import Foundation

var ryanWinInfo: [[Int]] = []
var ryanWinScore: Int = -1

func solution(_ n: Int, _ info: [Int]) -> [Int] {
    let ryanInfo = [Int](repeating: 0, count: 11)
    dfs(n, 0, ryanInfo, info)
    
    if ryanWinScore <= 0 {
        return [-1]
    }
    
    ryanWinInfo.sort {
        $0.filter { $0 != 0 }.count > $1.filter { $0 != 0 }.count
    }

    return ryanWinInfo.first!
}

func dfs(_ leftArrow: Int, _ index: Int, _ ryanInfo: [Int], _ appeachInfo: [Int]) {
    var ryanInfo = ryanInfo
    let leftArrow = leftArrow
    
    if index == 10 || leftArrow <= 0 {
        if index == 10 {
            ryanInfo[10] = leftArrow
        }
        
        // 점수차
        let gap = ryanAppeachGap(appeachInfo, ryanInfo)
        
        if gap == ryanWinScore {
            ryanWinInfo.append(ryanInfo)
        } else if gap > ryanWinScore {
            ryanWinScore = gap
            ryanWinInfo = [ryanInfo]
        }
        
        return
    }
    
    if leftArrow > appeachInfo[index] {
        ryanInfo[index] = appeachInfo[index] + 1
        
        let nextLeftArrow = leftArrow - (appeachInfo[index] + 1)
        dfs(nextLeftArrow, index + 1, ryanInfo, appeachInfo)
        ryanInfo[index] = 0
    }
    
    dfs(leftArrow, index + 1, ryanInfo, appeachInfo)
}

func ryanAppeachGap(_ appeach: [Int], _ ryan: [Int]) -> Int {
    var appeachScore = 0, ryanScore = 0

    for (index, ryan) in ryan.enumerated() {
        if ryan == 0 {
            appeachScore += (appeach[index] > 0 ? (10 - index) : 0)
        } else {
            ryanScore += (10 - index)
        }
    }

    return ryanScore - appeachScore
}
