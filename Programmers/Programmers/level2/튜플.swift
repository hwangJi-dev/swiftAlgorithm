//
//  튜플.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/14.
//

import Foundation

func solution2(_ s:String) -> [Int] {
    var tupleArr: [[Int]] = []
    let s = s.trimmingCharacters(in: ["{", "}"]).components(separatedBy: "},{")
    
    for i in s {
        tupleArr.append(i.components(separatedBy: ",").map({ Int($0)! }))
    }
    
    tupleArr = tupleArr.sorted { $0.count < $1.count }
    var resultArr: [Int] = []

    for result in tupleArr {
        for j in result {
            if !resultArr.contains(j) {
                resultArr.append(j)
            }
        }
    }
    
    return resultArr
}
