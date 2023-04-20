//
//  MVP 다이아몬드 (Easy).swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/20.
//

import Foundation
 
func solution20413() {
    let _ = Int(readLine()!)!
    let money = readLine()!.components(separatedBy: .whitespaces).map({ Int($0)! })
    let tier = Array(readLine()!).map({ String($0) })
    var moneyDict: [String: Int] = ["B": 0, "S": 0, "G": 0, "P": 0, "D": 0]
    
    moneyDict["B"] = money[0] - 1
    moneyDict["S"] = money[1] - 1
    moneyDict["G"] = money[2] - 1
    moneyDict["P"] = money[3] - 1
    moneyDict["D"] = money[3]
    
    var sumMoney = 0
    var lastMoney = 0
    
    for i in tier {
        let tierStandard = moneyDict[i]!
        var currentMoney = tierStandard - lastMoney
        if i == "D" {
            currentMoney = moneyDict[i]!
        }
        lastMoney = currentMoney
        sumMoney += currentMoney
    }
    
    print(sumMoney)
}

