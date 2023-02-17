//
//  하샤드 수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/20.
//

import Foundation

func solution7(_ x:Int) -> Bool {
    return x % Array(String(x)).map({ Int(String($0))! }).reduce(0, +) == 0 ? true : false
}
