//
//  문자열 다루기 기본.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/04.
//

import Foundation

func solution2(s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && s.allSatisfy({ $0.isNumber })
}
