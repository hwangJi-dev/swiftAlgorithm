//
//  나누어 떨어지는 숫자 배열.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/03.
//

import Foundation

func solution(arr:[Int], divisor:Int) -> [Int] {
    var answer: [Int] = []
    
    for i in arr.sorted() {
        if i % divisor == 0 {
            answer.append(i)
        }
    }
    
    return answer.isEmpty ? [-1] : answer
}
