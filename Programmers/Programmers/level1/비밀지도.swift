//
//  비밀지도.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/06.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for (index, i) in arr1.enumerated() {
        var radix1 = String(i, radix: 2)
        var radix2 = String(arr2[index], radix: 2)
        
        if radix1.count < n {
            while radix1.count < n {
                radix1.insert("0", at: radix1.startIndex)
            }
        }
        
        if radix2.count < n {
            while radix2.count < n {
                radix2.insert("0", at: radix2.startIndex)
            }
        }
        
        for (idx, j) in radix1.enumerated() {
            if j == "1" || Array(radix2)[idx] == "1" {
                map[index][idx] = 1
            }
        }
    }
    
    for m in map {
        var str = ""
        for k in m {
            str += k == 0 ? " " : "#"
        }
        answer.append(str)
    }
    
    return answer
    
    
    // 더 나은 풀이
    return (0..<n).map {
        // | : 비트 OR 연산자
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}

