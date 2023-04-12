//
//  가장 큰 수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/13.
//

import Foundation

func solution1(numbers:[Int]) -> String {
    let arr = numbers.sorted(by: { Int(String($0) + String($1))! > Int(String($1) + String($0))! })
    
    if arr.allSatisfy({ $0 == 0 }) {
        return "0"
    } else {
        return arr.map({ String($0) }).joined()
    }
}
