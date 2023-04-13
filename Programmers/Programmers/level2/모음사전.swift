//
//  모음사전.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/13.
//

import Foundation

var wordDict: [String: Int] = [:]
var count = 0

func solution(word:String) -> Int {
    dfs(words: [])
    return wordDict[word]!
}

func dfs(words: [String]) {
    wordDict[words.joined()] = count
    
    if words.count == 5 {
        return
    } else {
        for i in ["A", "E", "I", "O", "U"] {
            count += 1
            dfs(words: words + [i])
        }
    }
}
