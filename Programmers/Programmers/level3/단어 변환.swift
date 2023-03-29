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
    var visited = Array(repeating: false, count: words.count)
    dfs(words, begin, target, 0, &visited)
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

func dfs(_ words: [String], _ word: String, _ target: String, _ depth: Int, _ visited: inout [Bool]) {
    if word == target {
        minChangeCnt = minChangeCnt == 0 ? depth : min(depth, minChangeCnt)
        return
    }
    
    for (idx, i) in words.enumerated() {
        if visited[idx] == false && isChangableWord(word, i) {
            visited[idx] = true
            dfs(words, i, target, depth + 1, &visited)
            visited[idx] = false
        }
    }
}
