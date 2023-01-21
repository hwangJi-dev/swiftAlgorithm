//
//  부족한 금액 계산하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/21.
//

import Foundation

func solution(price:Int, money:Int, count:Int) -> Int64 {
    let p = Int64((1...count).map({ $0 * price }).reduce(0, +))
    return Int64(money) > p ? 0 : p - Int64(money)
}
