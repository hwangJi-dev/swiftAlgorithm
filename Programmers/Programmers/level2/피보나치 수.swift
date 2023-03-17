//
//  피보나치 수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/17.
//

import Foundation

func solution5(_ n:Int) -> Int {
    var f0 = 0
    var f1 = 1
    
    for _ in 2...n {
        var temp = ((f0 % 1234567) + (f1 % 1234567)) % 1234567
        f0 = f1 % 1234567
        f1 = temp
    }
    
    return f1
}


//func solution(_ n:Int) -> Int {
//    var fibo = [0, 1]
//
//    for i in 2...n {
//        fibo.append(fibo[i - 2] % 1234567 + fibo[i - 1] % 1234567)
//    }
//
//    return fibo[n]
//}
