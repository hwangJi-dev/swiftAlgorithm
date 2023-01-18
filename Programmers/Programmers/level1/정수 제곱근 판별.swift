//
//  정수 제곱근 판별.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution5(_ n:Int64) -> Int64 {
    let s = Int(sqrt(Double(n)))
    return s * s == n ? Int64((s + 1) * (s + 1)) : -1
}
