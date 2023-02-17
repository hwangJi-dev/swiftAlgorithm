//
//  옹알이(2).swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/12.
//

import Foundation

func solution(babbling:[String]) -> Int {
    let babble: [String: String] = ["aya": "1", "ye": "2", "woo": "3", "ma": "4"]
    var result = 0
    
    for b in babbling {
        var rep = b
        babble.forEach {
            rep = rep.replacingOccurrences(of: $0.key, with: $0.value)
        }
        
        if Int(rep) != nil && !rep.contains("11") && !rep.contains("22") && !rep.contains("33") && !rep.contains("44") {
            result += 1
        }
    }
    
    return result
}
