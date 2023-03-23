//
//  main.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation
if #available(macOS 13.0, *) {
    var s = "CAGCCTA"
    var p = [2, 5, 0]
    var q = [4, 5, 6]
    print(solution(&s, &p, &q))
} else {
    // Fallback on earlier versions
}
