//
//  메뉴 리뉴얼.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/23.
//

import Foundation

var resultDict: [[String]: Int] = [:]

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    for course in course {
        for order in orders {
            combination(Array(order.sorted()).map{ String($0) }, course)
        }
    }
    
    var result: [String] = []
    for course in course {
        // 최소 주문 횟수가 2 이상인 경우에 한해서만
        // 코스 등록이 가능하므로 maxCount를 2로 설정한다.
        var maxCount = 2
        var possibleMenu: [String] = []
        
        for menu in resultDict.keys {
            if menu.count == course {
                if resultDict[menu]! > maxCount {
                    maxCount = resultDict[menu]!
                    possibleMenu = [menu.sorted().joined()]
                } else if resultDict[menu] == maxCount {
                    possibleMenu.append(menu.sorted().joined())
                }
            }
        }
        
        possibleMenu.forEach {
            result.append($0)
        }
    }
    
    return result.sorted()
}

// MARK: - 조합
func combination(_ array: [String], _ n: Int) {
    if array.count < n { return }

    func cycle(_ index: Int, _ now: [String]) {
        if now.count == n {
            resultDict[now] = resultDict[now] != nil ? resultDict[now]! + 1 : 1
            return
        }

        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0,[])
}
