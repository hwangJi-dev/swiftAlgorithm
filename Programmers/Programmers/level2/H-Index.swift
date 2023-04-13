//
//  H-Index.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/13.
//

import Foundation

func solution(citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var ans = 0
    
    for i in 0..<citations.count {
        if i + 1 <= citations[i] {
            ans = i + 1
        } else {
            break
        }
    }
    
    return ans
}

//func solution(citations:[Int]) -> Int {
//    var HIndex = 0
//
//    for i in 0..<citations.max()! {
//        let up = citations.filter({ $0 >= i }).count
//        let down = citations.filter({ $0 < i }).count
//
//        if up >= i && down <= i {
//            HIndex = max(HIndex, i)
//        }
//    }
//
//    return HIndex
//}
