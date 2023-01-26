//
//  직사각형 별찍기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/26.
//

import Foundation

func solution_1() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    var s = ""
    for _ in 1...b {
        for _ in 1...a {
            s += "*"
        }
        s += "\n"
    }

    print(s)
}


