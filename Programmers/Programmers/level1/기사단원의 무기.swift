//
//  기사단원의 무기.swift
//  Programmers1
//
//  Created by hwangJi on 2022/11/23.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var divideNumbers: [Int] = []
    for i in 1...number {
        var divideNumber = 0
        for j in 1...Int(sqrt(Double(i))) {
                if i % j == 0 {
                    if j * j == i {
                       divideNumber += 1
                    } else {
                        divideNumber += 2
                    }
                }
            }
        
        if divideNumber > limit {
            divideNumber = power
        }
        
        divideNumbers.append(divideNumber)
    }
    
    return divideNumbers.reduce(0,+)
}
