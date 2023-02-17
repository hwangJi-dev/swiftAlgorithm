//
//  자연수 뒤집어 배열로 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution4(_ n:Int64) -> [Int] {
    return Array(String(n)).reversed().map({ Int(String($0))! })
}
