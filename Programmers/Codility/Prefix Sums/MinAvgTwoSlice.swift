//
//  MinAvgTwoSlice.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/23.
//

import Foundation

//public func solution4(A : inout [Int]) -> Int {
//    var sliceCount = 2
//    var minIndex = 0
//    var minAvrValue: Double = 100000
//
//    while sliceCount < A.count {
//        for i in 0..<A.count {
//            if i + sliceCount > A.count { break }
//            let temp: Double = Double(A[i...i + sliceCount - 1].reduce(0, +)) / Double(sliceCount)
//
//            if temp < minAvrValue {
//                minIndex = i
//                minAvrValue = temp
//            } else if temp == minAvrValue && minIndex > i {
//                minIndex = i
//            }
//        }
//
//        sliceCount += 1
//    }
//
//    return minIndex
//}


public func solution4(A : inout [Int]) -> Int {
    var minAvgValue: Double = Double(A[0] + A[1]) / 2
    var minIndex = 0
    
    for i in 2..<A.count {
        let avg2: Double = Double(A[i - 1] + A[i]) / 2
        if minAvgValue > avg2 {
            minAvgValue = avg2
            minIndex = i - 1
        }
        
        let avg3: Double = Double(A[i - 2] + A[i - 1] + A[i]) / 3
        if minAvgValue > avg3 {
            minAvgValue = avg3
            minIndex = i - 2
        }
    }
    
    return minIndex
}

