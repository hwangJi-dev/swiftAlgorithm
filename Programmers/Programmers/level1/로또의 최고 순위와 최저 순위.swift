//
//  로또의 최고 순위와 최저 순위.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/05.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let min = win_nums.filter({ lottos.contains($0 )}).count
    let max = min + lottos.filter({ $0 == 0 }).count
    return [max == 0 ? 6 : abs(max - 7), min == 0 ? 6 : abs(min - 7)]
}
