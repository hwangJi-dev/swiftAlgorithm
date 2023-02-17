//
//  명예의 전당(1).swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/13.
//

import Foundation

func solution1(_ k:Int, _ score:[Int]) -> [Int] {
    var honorArray: [Int] = []
    var lastArray: [Int] = []
    
    for i in score {
        if honorArray.count < k {
            honorArray.append(i)
        } else {
            honorArray.sort(by: >)
            if i >= honorArray.last! {
                honorArray.removeLast()
                honorArray.append(i)
            }
        }
        
        honorArray.sort(by: >)
        lastArray.append(honorArray.last!)
    }
    
    return lastArray
}
