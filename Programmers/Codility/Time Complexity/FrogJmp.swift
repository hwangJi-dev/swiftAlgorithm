//
//  FrogJmp.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/22.
//

import Foundation

public func solution(X : Int, Y : Int, D : Int) -> Int {
    let jmp = (Y - X) / D
    return (Y - X) % D != 0 ? jmp + 1 : jmp
}
