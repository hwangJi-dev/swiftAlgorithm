//
//  ParkingBill.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/26.
//

import Foundation

public func solution(E : inout String, L : inout String) -> Int {
    let e = E.components(separatedBy: ":").map({ Int($0)! })
    let l = L.components(separatedBy: ":").map({ Int($0)! })
    var time = 0
    
    if e[0] < l[0] {
        if e[1] > 0 {
            time += 60 - e[1]
        } else {
            time += 60
        }
        
        time += (l[0] - e[0] - 1) * 60 + l[1]
    } else {
        time += l[1]
    }
    
    if time == 0 {
        return 2
    } else if time <= 60 {
        return 5
    } else {
        return 2 + 3 + ((time - 60) / 60) * 4 + (time % 60 > 0 ? 4 : 0)
    }
}
