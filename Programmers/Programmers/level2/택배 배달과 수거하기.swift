//
//  택배 배달과 수거하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/21.
//

import Foundation

func solution(cap:Int, n:Int, deliveries:[Int], pickups:[Int]) -> Int64 {
    var deliverStack: [(Int, Int)] = []
    var pickupStack: [(Int, Int)] = []
    var distance = 0
    
    for i in 0..<n {
        if deliveries[i] != 0 {
            deliverStack.append((i, deliveries[i]))
        }
        
        if pickups[i] != 0 {
            pickupStack.append((i, pickups[i]))
        }
    }
    
    while !deliverStack.isEmpty || !pickupStack.isEmpty {
        let deliverLastIdx = deliverStack.last?.0 ?? 0
        let pickupLastIdx = pickupStack.last?.0 ?? 0
        
        if deliverLastIdx > pickupLastIdx {
            distance += (deliverLastIdx + 1) * 2
        } else {
            distance += (pickupLastIdx + 1) * 2
        }
        
        var deliverBox = cap
        var pickupBox = cap
        
        while deliverBox > 0 && !deliverStack.isEmpty {
            if deliverBox - (deliverStack.last?.1 ?? 0) < 0 {
                deliverStack[deliverStack.count - 1].1 -= deliverBox
                break
            } else {
                deliverBox -= deliverStack.popLast()?.1 ?? 0
            }
        }
        
        while pickupBox > 0 && !pickupStack.isEmpty {
            if pickupBox - (pickupStack.last?.1 ?? 0) < 0 {
                pickupStack[pickupStack.count - 1].1 -= pickupBox
                break
            } else {
                pickupBox -= pickupStack.popLast()?.1 ?? 0
            }
        }
    }
    
    return Int64(distance)
}
