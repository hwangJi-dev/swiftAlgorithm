//
//  main.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation
if #available(macOS 13.0, *) {
    var a: [Int] = [2, 1, 5, 1, 2, 2, 2]
    print(solution(K: 3, M: 5, A: &a))
} else {
    // Fallback on earlier versions
}
