//
//  LongestPassword.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/25.
//

import Foundation

public func solution2(S : inout String) -> Int {
    let s = S.components(separatedBy: .whitespaces).filter({ $0.count % 2 == 1 })
    var longestSCount = -1
    
    for i in s {
        if checkIsValidString(i) {
            if longestSCount < i.count {
                longestSCount = i.count
            }
        }
    }
    
    return longestSCount
}

public func checkIsValidString(_ S: String) -> Bool {
    // 1. 숫자와 영문자만 포함할 것
    let regexPattern = "^[0-9a-zA-Z]*$"
    guard let _ = S.range(of: regexPattern, options: .regularExpression) else { return false }
    
    // 2. 문자가 짝수개일 것
    if S.replacingOccurrences(of: "[0-9]", with: "", options: .regularExpression).count % 2 != 0 { return false }
    
    return true
}
