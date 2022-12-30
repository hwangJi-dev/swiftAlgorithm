//
//  크기가 작은 부분 문자열.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/30.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var result = 0
    
    for (index, _) in Array(t).enumerated() {
        if index + p.count <= t.count {
            if Array(t)[index..<index + p.count].map({ String($0) }).joined() <= p {
                result += 1
            }
        }
    }
    
    return result
}
