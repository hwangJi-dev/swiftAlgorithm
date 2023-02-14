//
//  다음 큰 숫자.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/14.
//

import Foundation

func solution4(n:Int) -> Int
{
    var answer:Int = 0
    var cnt = String(n, radix: 2).filter({ $0 == "1" }).count
    
    for i in n + 1...1000000 {
        if cnt == String(i, radix: 2).filter({ $0 == "1" }).count {
            answer = i
            break
        }
    }
    
    return answer
}
