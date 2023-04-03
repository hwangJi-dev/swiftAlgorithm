//
//  불량 사용자.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/02.
//

import Foundation

func solution(user_id:[String], banned_id:[String]) -> Int {
    var banUserDict: [String: Set<Int>] = [:]
    var bannedCases: Set<Set<String>> = []

    for b in banned_id {
        if banUserDict[b] == nil {
            banUserDict[b] = []
        }

        for (udx, u) in user_id.enumerated() {
            if checkBanId(u, b) {
                banUserDict[b]?.insert(udx)
            }
        }
    }
    
    // dfs 수행 재귀함수
    func dfs(_ banIdx: Int, _ userIdx: Int, _ bannedCase: Set<String>, _ visited: [Bool]) {
        var bannedCase = bannedCase
        var visited = visited

        if !visited[userIdx] {
            visited[userIdx] = true
            bannedCase.insert(user_id[userIdx])
            if banIdx + 1 < banned_id.count {
                for i in banUserDict[banned_id[banIdx + 1]]! {
                    dfs(banIdx + 1, i, bannedCase, visited)
                }
            }
        }

        if bannedCase.count == banned_id.count {
            bannedCases.insert(bannedCase)
            return
        }
    }

    let visited = Array(repeating: false, count: user_id.count)
    
    for i in banUserDict[banned_id[0]]! {
        dfs(0, i, [], visited)
    }

    return bannedCases.count
}

// MARK: - 제한당한 id인지 확인하고 제한여부를 리턴하는 메서드
func checkBanId(_ user_id: String, _ banned_id: String) -> Bool {
    if banned_id.count != user_id.count { return false }

    let userID = Array(user_id)
    for (idx, i) in banned_id.enumerated() {
        if i != "*" && i != userID[idx] { return false }
    }

    return true
}

/// (2) 순열을 이용한 풀이
//func solution(user_id:[String], banned_id:[String]) -> Int {
//    var bannedCases: Set<Set<String>> = []
//    let perm = permutation_(user_id, banned_id.count)
//
//    for p in perm {
//        var isValid = true
//        for (idx, i) in p.enumerated() {
//            if !checkBanId(i, banned_id[idx]) {
//                isValid = false
//            }
//        }
//
//        if isValid {
//            bannedCases.insert(Set(p))
//        }
//    }
//
//    return bannedCases.count
//}
//
//// MARK: - 순열 메서드
//func permutation_(_ array: [String], _ n: Int) -> [[String]] {
//    var result = [[String]]()
//    if array.count < n { return result }
//
//    var visited = Array(repeating: false, count: array.count)
//
//    func cycle(_ now: [String]) {
//        if now.count == n {
//            result.append(now)
//            return
//        }
//
//        for i in 0..<array.count {
//            if visited[i] {
//                continue
//            } else {
//                visited[i] = true
//                cycle(now + [array[i]])
//                visited[i] = false
//            }
//        }
//    }
//
//    cycle([])
//
//    return result
//}
