//
//  n진수 게임.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/28.
//

import Foundation

func solution(n:Int, t:Int, m:Int, p:Int) -> String {
    var game: [String] = []
    print(String(16, radix: 16))
    for i in 0..<(m * t) {
        game.append(contentsOf: Array(String(i, radix: n).uppercased()).map({ String($0) }))
    }
    
    return stride(from: p - 1, to: m * t, by: m).reduce("", { $0 + game[$1] })
}
