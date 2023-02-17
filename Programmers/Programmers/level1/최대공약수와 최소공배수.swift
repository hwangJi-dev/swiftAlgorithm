//
//  최대공약수와 최소공배수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/21.
//

import Foundation

func solution2(n:Int, m:Int) -> [Int] {
    var max = 1

    for i in 1...(n > m ? n : m) {
        if n % i == 0 && m % i == 0 && max < i {
            max = i
        }
    }
    
    return [max, (n * m) / max]
}
