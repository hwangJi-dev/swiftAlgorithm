//
//  영어 끝말잇기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/14.
//

import Foundation


func solution(n:Int, words:[String]) -> [Int] {
    var dict: [String: Int] = [:]
    var ans = [0,0]
    
    for (index, word) in words.enumerated() {
        // 탈락 - 한 글자, 중복, 끝 말과 이어지지 않는 경우
        if index != 0 && (dict[word] != nil || word.count == 1 || words[index - 1].last != word.first) {
            ans = [(index % n) + 1, (index / n) + 1]
            break
        }
        
        dict[word] = index
    }
    
    return ans
}
