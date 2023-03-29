//
//  단어 변환.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/29.
//

import Foundation

var minChangeCnt = 0

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) { return 0 }
    
    let words = [begin] + words
    var changableDict: [String: [String]] = [:]
    
    for i in words {
        let i = String(i)
        if changableDict[i] == nil {
            changableDict[i] = []
        }
        
        for j in words {
            if j == i { continue }
            
            if isChangableWord(i, j) {
                changableDict[i]?.append(j)
            }
        }
    }
    
    dfsToFindTargetWord(begin, target, [], changableDict)
    
    return minChangeCnt
}

func isChangableWord(_ word1: String, _ word2: String) -> Bool {
    let word1 = Array(word1)
    let word2 = Array(word2)
    
    var diff = 0
    for i in 0..<word1.count {
        if word1[i] != word2[i] {
            diff += 1
        }
    }
    
    return diff == 1 ? true : false
}

func dfsToFindTargetWord(_ start: String, _ target: String, _ visited: [String], _ dict: [String: [String]]) {
    var visited = visited
    
    if start == target {
        minChangeCnt = minChangeCnt == 0 ? visited.count : min(visited.count, minChangeCnt)
        return
    }
    
    guard let _ = dict[start] else { return }
    
    if dict[start]!.isEmpty {
        return
    } else {
        visited.append(start)
        for i in dict[start]! {
            if !visited.contains(i) {
                dfsToFindTargetWord(i, target, visited, dict)
            }
        }
    }
}
