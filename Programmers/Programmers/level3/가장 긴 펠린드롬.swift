//
//  가장 긴 펠린드롬.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/02.
//

import Foundation

func solution3(_ s:String) -> Int {
    var maxSubstring = 1
    var s = Array(s)
    
    if s.count == 0 { return 0 }
    if s.count == 1 { return 1 }
    
    for i in stride(from: s.count, to: 1, by: -1) {
        var isPal = false
        
        ol: for j in 0...s.count - i {
            var p = (i / 2) + j
            var l = j + i - 1
            
            for k in j...p {
                if s[k] != s[l - (k - j)] {
                    continue ol
                }
            }
            
            return i
        }
    }
    
    return maxSubstring
}
