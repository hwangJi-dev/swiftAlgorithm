//
//  정수 내림차순으로 배치하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/18.
//

import Foundation

func solution(n5:Int64) -> Int64 {
    return Int64(Int(Array(String(n5)).sorted(by: >).map({ String($0) }).joined())!)
}
