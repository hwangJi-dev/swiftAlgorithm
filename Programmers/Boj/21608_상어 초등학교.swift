//
//  21608_상어 초등학교.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/21.
//

import Foundation

func solution21608() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    var sloDict: [Int: [Int]] = [:]
    var nearDict: [[Int]: Int] = [:]
    var sLikeDict: [Int: [Int]] = [:]
    
    for i in 0..<n {
        for j in 0..<n {
            if (i > 0 && i < n - 1) && (j > 0 && j < n - 1) {
                nearDict[[i, j]] = 4
            } else if (i == 0 && j == 0) || (i == 0 && j == n - 1) || (i == n - 1 && j == n - 1) || (i == n - 1 && j == 0) {
                nearDict[[i, j]] = 2
            } else {
                nearDict[[i, j]] = 3
            }
        }
    }
    
    for _ in 0..<Int(pow(Double(n), 2)) {
        let sArr = readLine()!.components(separatedBy: .whitespaces)
        let s = Int(sArr[0])!
        let likes = sArr[1...4].map({ Int(String($0))! })
        var likeDict: [[Int]: Int] = [:]
        sLikeDict[s] = likes

        for l in likes {
            // 인접 좌표 구하기
            if sloDict[l] != nil {
                let lo = sloDict[l]!
                let u = [lo[0] - 1, lo[1]]
                let d = [lo[0] + 1, lo[1]]
                let l = [lo[0], lo[1] - 1]
                let r = [lo[0], lo[1] + 1]
                
                for i in [u, d, l, r] {
                    if i[0] < 0 || i[0] > n - 1 || i[1] < 0 || i[1] > n - 1 {
                        continue
                    }
                    
                    // 비어있는 칸일 경우에만 검사하기
                    if board[i[0]][i[1]] == 0 {
                        if likeDict[i] == nil {
                            likeDict[i] = 1
                        } else {
                            likeDict[i]! += 1
                        }
                    }
                }
            }
        }
        
        if likeDict.keys.isEmpty {
            // 가장 빈 칸이 많으면서 행이 작은 칸으로 배치
            let near = nearDict.sorted(by: {
                if $0.value == $1.value {
                    if $0.key[0] == $1.key[0] {
                        return $0.key[1] < $1.key[1]
                    } else {
                        return $0.key[0] < $1.key[0]
                    }
                } else {
                    return $0.value > $1.value
                }
            }).first!.key
            
            board[near[0]][near[1]] = s
            sloDict[s] = [near[0],near[1]]
            nearDict.removeValue(forKey: [near[0], near[1]])
            
            if nearDict[[near[0] + 1, near[1]]] != nil {
                nearDict[[near[0] + 1, near[1]]]! -= 1
            }
            if nearDict[[near[0] - 1, near[1]]] != nil {
                nearDict[[near[0] - 1, near[1]]]! -= 1
            }
            if nearDict[[near[0], near[1] + 1]] != nil {
                nearDict[[near[0], near[1] + 1]]! -= 1
            }
            if nearDict[[near[0], near[1] - 1]] != nil {
                nearDict[[near[0], near[1] - 1]]! -= 1
            }
        } else {
            let lo = likeDict.sorted(by: {
                // 좋아하는 학생이 인접한 칸에 가장 많은 칸
                if $0.value == $1.value {
                    // 1을 만족하는 칸이 여러 개이면, 인접한 칸 중에서 비어있는 칸이 가장 많은 칸
                    if nearDict[$0.key]! == nearDict[$1.key]! {
                        // 2를 만족하는 칸도 여러 개인 경우에는 행의 번호가 가장 작은 칸
                        if $0.key[0] == $1.key[0] {
                            // 그러한 칸도 여러 개이면 열의 번호가 가장 작은 칸
                            return $0.key[1] < $1.key[1]
                        } else {
                            return $0.key[0] < $1.key[0]
                        }
                    } else {
                        return nearDict[$0.key]! > nearDict[$1.key]!
                    }
                } else {
                    return $0.value > $1.value
                }
            }).first!.key
            
            board[lo[0]][lo[1]] = s
            sloDict[s] = [lo[0], lo[1]]
            nearDict.removeValue(forKey: [lo[0], lo[1]])
            
            if nearDict[[lo[0] + 1, lo[1]]] != nil {
                nearDict[[lo[0] + 1, lo[1]]]! -= 1
            }
            if nearDict[[lo[0] - 1, lo[1]]] != nil {
                nearDict[[lo[0] - 1, lo[1]]]! -= 1
            }
            if nearDict[[lo[0], lo[1] + 1]] != nil {
                nearDict[[lo[0], lo[1] + 1]]! -= 1
            }
            if nearDict[[lo[0], lo[1] - 1]] != nil {
                nearDict[[lo[0], lo[1] - 1]]! -= 1
            }
        }
    }
    
    var sum = 0
    
    for s in sLikeDict {
        let lo = sloDict[s.key]!
        var cnt = 0
        
        for sn in s.value {
            let u = [lo[0] - 1, lo[1]]
            let d = [lo[0] + 1, lo[1]]
            let l = [lo[0], lo[1] - 1]
            let r = [lo[0], lo[1] + 1]
            
            for i in [u, d, l, r] {
                if i[0] < 0 || i[0] > n - 1 || i[1] < 0 || i[1] > n - 1 {
                    continue
                }
                
                if board[i[0]][i[1]] == sn {
                    cnt += 1
                }
            }
        }
        
        if cnt > 0 {
            sum += Int(pow(10, Double(cnt - 1)))
        }
    }
    
    print(sum)
}
