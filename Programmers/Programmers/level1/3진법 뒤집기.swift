//
//  3진법 뒤집기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/26.
//

import Foundation

func solution4(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}
