//
//  마법의 엘리베이터.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/08.
//

import Foundation

func solution(storey: Int) -> Int {
    var storey = storey
    var result = 0

    while storey != 0 {
        if storey % 10 > 5 || (storey % 10 == 5 && (storey / 10) % 10 >= 5) {
            result += 10 - (storey % 10)
            storey = (storey / 10) + 1
        } else {
            result += storey % 10
            storey = storey / 10
        }
    }

    return result
}
