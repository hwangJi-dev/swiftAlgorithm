//
//  JadenCase 문자열 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/23.
//

import Foundation

func solution(s:String) -> String {
    let s = Array(s).map{ String($0) }
    var temp = ""
    var ans = ""
    
    for i in 0..<s.count {
        temp += String(s[i])
        
        if s[i] == " " || i == s.count - 1 {
            if let t = temp.first {
                ans += Int(String(t)) == nil ? temp.capitalized : temp.lowercased()
                temp = ""
            }
        }
    }
    
    return ans
}
