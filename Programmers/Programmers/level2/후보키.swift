//
//  후보키.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/03.
//

import Foundation
var exception: [[Int]] = []

@available(macOS 13.0, *)
func solution(relation:[[String]]) -> Int {
    var ans = 0
    
    for i in 1...relation[0].count {
        ans += combination([Int](1...relation[0].count), i, relation)
    }
    
    return ans
}

// MARK: 조합을 추출하고 해당 조합이 후보키를 만족하는지 판별하여 후보키의 개수를 리턴하는 메서드
@available(macOS 13.0, *)
func combination(_ array: [Int], _ n: Int, _ relation: [[String]]) -> Int {
    var result = 0
    if array.count < n { return result }
    
    func cycle(_ index: Int, _ now: [Int]) {
        if now.count == n {
            // 이미 추출된 후보키 조합에 현재 조합이 속하는지 검사
            for e in exception {
                var arr: [Bool] = []
                for i in e {
                    if now.contains(i) {
                        arr.append(true)
                    }
                }
                
                // 속한다면 후보키를 만족하는지 판별하지 않고 넘어간다
                if arr.count == e.count {
                    return
                }
            }
            
            // 속하지 않는다면 후보키를 만족하는지 판별한다
            if validateKey(comb: now, relation: relation) {
                // 후보키를 만족하는 조합이라면 결과에 +1
                result += 1
                // 예외가 되어야하므로 exception 배열에 append
                exception.append(now)
            }
            
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0,[])
    
    return result
}

// MARK: 현재 조합이 후보키를 만족하는지 판별하는 메서드
func validateKey(comb: [Int], relation: [[String]]) -> Bool {
    var isKey = true
    var dict: [[String]: String] = [:]
    
    for r in 0..<relation.count {
        var key: [String] = []
        for c in comb {
            key.append(String(relation[r][c - 1]))
        }
        
        if dict[key] == nil {
            dict[key] = ""
        } else {
            dict.removeAll()
            isKey = false
            break
        }
    }
    
    return isKey ? true : false
}
