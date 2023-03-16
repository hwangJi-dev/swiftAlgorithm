//
//  범위 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/18.
//

import Foundation

func solution_softeer2() {
    let MN = readLine()
    let M = readLine()!.components(separatedBy: .whitespaces).compactMap({ Int($0) })
    let N = readLine()!.components(separatedBy: .whitespaces).compactMap({ Int($0) })
    var K = Int(readLine()!)!
    
    let totalMN = (M + N).sorted()
    let totalRange = [totalMN.first!, totalMN.last!]
    
    let intersection = Set(M).intersection(Set(N)).map({ Int($0) }).sorted()
    
    // 최대 K개이므로 교집합 개수보다 K가 큰 경우
    // K를 intersection.count로 바꾸어 계산해준다.
    if intersection.count < K {
        K = intersection.count
    }
    
    var maxRange = 0
    
    for i in 0..<intersection.count {
        if i + K - 1 <= intersection.count - 1 {
            var ran = 0
            if i + K - 1 == intersection.count - 1 || i == intersection.count - 1 {
                if i == 0 {
                    ran = totalRange.last! - totalRange[0] + 1
                } else {
                    ran = totalRange.last! - (intersection[i - 1] + 1) + 1
                }
            } else if i == 0 {
                ran = (intersection[i + K - 1] - 1) - totalRange[0] + 1
            } else {
                ran = (intersection[i + K - 1] - 1) - (intersection[i - 1] + 1) + 1
            }
            maxRange = maxRange < ran ? ran : maxRange
        }
    }
    
    print(maxRange)
}

// 8 8
// 1 2 4 5 6 9 12 13
// 3 4 5 7 8 9 11 12
// 5
// 답: 13
