//
//  푸드 파이트 대회.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution(food:[Int]) -> String {
    let str = (1...food.count - 1).flatMap{ Array(repeating: $0, count: food[$0] / 2) }.map{ String($0) }.joined()
    return str + "0" + str.reversed()
}
