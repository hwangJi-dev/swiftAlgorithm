//
//  main.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation
if #available(macOS 13.0, *) {
    var a = 4
    var b: [Int] = [1, 2, 3, 4, 1, 1, 3]
    print(solution(K: a, A: &b))
} else {
    // Fallback on earlier versions
}
