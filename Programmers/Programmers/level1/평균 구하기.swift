//
//  평균 구하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution2(arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}
