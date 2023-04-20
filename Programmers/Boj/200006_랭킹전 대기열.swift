//
//  200006_랭킹전 대기열.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/20.
//

import Foundation

func solution200006() {
    let pm = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var roomArr: [(Int, Int)] = []
    var roomInfo: [Int: [(Int, String)]] = [:]
    
    for _ in 0..<pm[0] {
        let p = readLine()!.split(separator: " ").map({ String($0) })
        let level = Int(p[0])!
        let id = p[1]
        var room = -1
        
        for (idx, r) in roomArr.enumerated() {
            if level >= r.0 && level <= r.1 && roomInfo[idx]!.count < pm[1] {
                room = idx
                roomInfo[idx]!.append((level, id))
                break
            }
        }
        
        if room == -1 {
            // 새로운 방 생성
            roomArr.append((level - 10, level + 10))
            roomInfo[roomArr.count - 1] = [(level, id)]
        }
    }
    
    for (idx, _) in roomArr.enumerated() {
        if roomInfo[idx]!.count == pm[1] {
            print("Started!")
        } else {
            print("Waiting!")
        }
        
        for j in roomInfo[idx]!.sorted(by: { $0.1 < $1.1 }) {
            print("\(j.0) \(j.1)")
        }
    }
}
