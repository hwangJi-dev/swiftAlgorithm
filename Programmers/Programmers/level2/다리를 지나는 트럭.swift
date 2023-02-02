//
//  다리를 지나는 트럭.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/01.
//

import Foundation

func solution(bridge_length:Int, weight:Int, truck_weights:[Int]) -> Int {
    var truck = truck_weights
    var bridge: [Int] = Array(repeating: 0, count: bridge_length)
    var tc = (0,0)
    var ans = 0
    
    // 트럭이 다 출발할 때까지 반복
    while !truck.isEmpty {
        // 도착
        let arrive = bridge.removeFirst()
        
        // 트럭이 도착했다면 (트럭이 도착하지 않은 경우에는 0이 꺼내짐)
        if arrive != 0 {
            // 다리 위의 트럭 개수 - 1
            tc.0 -= 1
            // 다리 위의 무게 - 도착한 트럭 무게
            tc.1 -= arrive
        }
        
        // 출발 대기중인 트럭 무게 + 현재 다리 위의 무게가 weight 이하이고
        // 출발 대기중인 트럭을 출발시켰을 때 다리 위의 트럭 개수가 기준 트럭 개수 이하라면
        if tc.1 + truck[0] <= weight && bridge_length >= tc.0 + 1 {
            // 트럭을 출발시킨다
            let departure = truck.removeFirst()
            bridge.append(departure)
            tc.0 += 1
            tc.1 += departure
        } else {
            // 그렇지 않다면 트럭을 출발시키지 않는다
            bridge.append(0)
        }
        
        ans += 1
    }
    
    return ans + bridge_length
}
