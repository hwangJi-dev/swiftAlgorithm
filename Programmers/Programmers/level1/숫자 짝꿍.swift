//
//  숫자 짝꿍.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/04.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var result: String = ""
    
    for i in 0...9 {
        let x = X.filter({ String($0) == String(i) })
        let y = Y.filter({ String($0) == String(i) })
        result += String(repeating: String(i), count: min(x, y).count)
    }
    
    result = result.sorted(by: >).map({ String($0 )}).joined()
    result = result == "" ? "-1" : result
    
    return result.allSatisfy({ $0 == "0" }) ? "0" : result
}
