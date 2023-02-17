//
//  개인정보 수집 유효기간.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termDict: [String: Int] = [:]
    let today = today.components(separatedBy: ".")
    var result: [Int] = []
    
    for term in terms {
        let t = term.components(separatedBy: .whitespaces)
        termDict[t[0]] = Int(t[1])
    }
    
    for (index, privacy) in privacies.enumerated() {
        let p = privacy.components(separatedBy: .whitespaces)[1]
        var d = privacy.components(separatedBy: .whitespaces)[0].components(separatedBy: ".").compactMap{ Int(String($0)) }
        
        d[0] += termDict[p]! / 12
        d[1] += termDict[p]! % 12
        d[2] -= 1
        
        if d[1] > 12 {
            d[1] -= 12
            d[0] += 1
        }
        
        if d[2] == 0 {
            d[1] -= 1
            d[1] = d[1] == 0 ? 12 : d[1]
            d[0] -= d[1] == 0 ? 1 : 0
            d[2] = 28
        }
        
        var s = d.map({ String($0) })
        s[1] = String(format: "%02d", arguments: [d[1]])
        s[2] = String(format: "%02d", arguments: [d[2]])
        
        if today.joined() > s.joined() {
            result.append(index + 1)
        }
    }

    return result
}
