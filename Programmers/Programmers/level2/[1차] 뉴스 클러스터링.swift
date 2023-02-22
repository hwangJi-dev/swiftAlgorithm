//
//  [1차] 뉴스 클러스터링.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/22.
//

import Foundation

func solution(str1:String, str2:String) -> Int {
    let str1MultipleArr: [String] = sliceArr(Array(str1).map{ String($0) }, "^[a-z]+$")
    let str2MultipleArr: [String] = sliceArr(Array(str2).map{ String($0) }, "^[a-z]+$")
    let key = Set(str1MultipleArr + str2MultipleArr)
    
    var intersection: [String] = []
    var union: [String] = []
    
    for k in key {
        let s1 = str1MultipleArr.filter{ $0 == k }.count
        let s2 = str2MultipleArr.filter{ $0 == k }.count
        
        // 교
        if s1 != 0 && s2 != 0 {
            for _ in 0..<min(s1, s2) {
                intersection.append(k)
            }
        }
        
        // 합
        for _ in 0..<max(s1, s2) {
            union.append(k)
        }
    }
    
    if intersection.count == 0 && union.count == 0 {
        return 65536
    } else {
        return Int((Double(intersection.count) / Double(union.count) * 65536))
    }
}

func sliceArr(_ str: [String], _ regex: String) -> [String] {
    var arr: [String] = []
    for i in 0..<str.count - 1 {
        let s = str[i...i + 1].map{ String($0) }.joined().lowercased()
        
        if !s.allSatisfy({ $0.isLetter }) {
            continue
        }
        if s.range(of: regex, options: .regularExpression) == nil {
            continue
        }

        arr.append(s)
    }
    
    return arr
}
