//
//  할인행사.swift
//  Programmers1
//
//  Created by hwangJi on 2022/10/11.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var wantDict: [String: Int] = [:]
    let discount = discount
    
    for i in 0..<want.count {
        wantDict[want[i]] = number[i]
    }
    
    // 할인 상품에 원하는 상품이 없는 경우
    for i in want {
        if discount.contains(i) == false {
            return 0
        }
    }
    
    var discountDay = 0
    
    for i in 0...discount.count - 10 {
        var discountArray: [String] = []
        var discountDict: [String: Int] = [:]
        
        for j in i..<i+10 {
            discountArray.append(discount[j])
            discountDict[discount[j]] = discountDict[discount[j]] != nil ? discountDict[discount[j]]! + 1 : 1
        }
        
        var validateArray: [Bool] = []
        for want in want {
            validateArray.append(discountArray.contains(want) ? true : false)
        }
        
        if !validateArray.contains(false) {
            var isCorrect: [Bool] = []
            
            for k in wantDict {
                isCorrect.append(k.value > discountDict[k.key] ?? 0 ? false : true)
            }
            
            if !isCorrect.contains(false) {
                discountDay += 1
            }
        }
    }
    
    return discountDay
}
