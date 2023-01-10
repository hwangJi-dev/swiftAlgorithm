//
//  이상한 문자 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution3(_ s:String) -> String {
    var b = false
    var result = ""
    
    for i in s {
        result += i == " " ? " " : (b ? i.lowercased() : i.uppercased())
        b = i == " " ? false : !b
    }
    
    return result
}
