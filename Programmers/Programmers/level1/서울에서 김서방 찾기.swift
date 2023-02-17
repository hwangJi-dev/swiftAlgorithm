//
//  서울에서 김서방 찾기.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/02.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    var kimLocation: Int = 0

    for (index, i) in seoul.enumerated() {
        if i == "Kim" {
            kimLocation = index
            break
        }
    }

    return "김서방은 \(kimLocation)에 있다"
}

func solution2(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}
