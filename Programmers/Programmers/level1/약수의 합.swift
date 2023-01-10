//
//  약수의 합.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution(n1:Int) -> Int {
//    var result = 0
//
//    for i in 1...Int(sqrt(Double(n1))) {
//        if n1 % i == 0 {
//            if i != n1 / i {
//                result += (n1 / i)
//            }
//            result += i
//        }
//    }
    guard n1 != 0 else { return 0 }
    return Array(1...n1).filter{ n1 % $0 == 0 }.reduce(0, +)
}
