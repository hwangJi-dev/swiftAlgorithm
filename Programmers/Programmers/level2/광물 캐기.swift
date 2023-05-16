//
//  광물 캐기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/16.
//

import Foundation

func solution(picks:[Int], minerals:[String]) -> Int {
    var sumArrByStoneTools: [([String], Int)] = []
    let maxToolCount = picks.reduce(0, +)
    
    for i in stride(from: 0, to: minerals.count, by: 5) {
        var gijoon = 0
        
        if i + 4 < minerals.count {
            gijoon =  i + 4
        } else {
            gijoon = minerals.count - 1
        }
        
        let m = minerals[i...gijoon].map({ String($0) })
        var temp = 0
        
        for j in m {
            if j == "diamond" {
                temp += 25
            } else if j == "iron" {
                temp += 5
            } else {
                temp += 1
            }
        }
        
        sumArrByStoneTools.append((m, temp))
    }
    
    if sumArrByStoneTools.count > maxToolCount {
        sumArrByStoneTools = Array(sumArrByStoneTools[0..<maxToolCount])
    }
    
    sumArrByStoneTools = sumArrByStoneTools.sorted(by: { $0.1 > $1.1 })
    
    var sum = 0
    var idx = 0
    var picks = picks
    
    while picks.allSatisfy({ $0 == 0 }) == false && idx < sumArrByStoneTools.count {
        if picks[0] > 0 {
            picks[0] -= 1
            sum += calSum(1, sumArrByStoneTools[idx].0)
        } else if picks[1] > 0 {
            picks[1] -= 1
            sum += calSum(2, sumArrByStoneTools[idx].0)
        } else {
            picks[2] -= 1
            sum += calSum(3, sumArrByStoneTools[idx].0)
        }
        
        idx += 1
    }
    
    return sum
}

func calSum(_ type: Int, _ minerals: [String]) -> Int {
    let toolDict: [Int : [Int]] = [1: [1, 1, 1], 2: [5, 1, 1], 3: [25, 5, 1]]
    var sum = 0
    
    for i in minerals {
        if i == "diamond" {
            sum += toolDict[type]![0]
        } else if i == "iron" {
            sum += toolDict[type]![1]
        } else {
            sum += toolDict[type]![2]
        }
    }
    
    return sum
}
