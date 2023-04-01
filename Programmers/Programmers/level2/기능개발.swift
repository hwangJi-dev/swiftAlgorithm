//
//  기능개발.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

func solution(progresses:[Int], speeds:[Int]) -> [Int] {
    var res: [Int] = []
    var count = 0
    var day = 0
    
    for (idx, progress) in progresses.enumerated() {
        let remain = ((100 - progress) / speeds[idx]) + (((100 - progress) % speeds[idx]) == 0 ? 0 : 1)
        if day == 0 {
            day = remain
        }
        
        if day < remain {
            day = remain
            res.append(count)
            count = 1
        } else {
            count += 1
        }
    }
    
    return count > 0 ? res + [count] : res
}

//func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//    var remains: [Int] = []
//
//    for (idx, progress) in progresses.enumerated() {
//        let remain = ((100 - progress) / speeds[idx]) + (((100 - progress) % speeds[idx]) == 0 ? 0 : 1)
//        remains.append(remain)
//    }
//
//    remains = remains.reversed()
//
//    var distributionCount = 0
//    var distributionDay = 0
//    var res: [Int] = []
//
//    if let rem = remains.popLast() {
//        distributionDay = rem
//        distributionCount = 1
//    }
//
//    while !remains.isEmpty {
//        if distributionDay >= remains.last! {
//            remains.popLast()
//            distributionCount += 1
//        } else {
//            distributionDay = remains.popLast() ?? 0
//            res.append(distributionCount)
//            distributionCount = 1
//        }
//    }
//
//    return distributionCount == 0 ? res : res + [distributionCount]
//}
