//
//  이모티콘 할인행사.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

var finalEmtiPlusCnt = 0
var finalSum = 0
var user: [[Int]] = []
var emoticon: [Int] = []

func solution(users:[[Int]], emoticons:[Int]) -> [Int] {
    user = users.sorted(by: { $0[0] > $1[0] })
    emoticon = emoticons
    
    dfs(index: 0, arr: [], max: emoticons.count, sales: [10, 20, 30, 40].filter({ $0 >= user.last![0] }))
    
    return [finalEmtiPlusCnt, finalSum]
}

func dfs(index: Int, arr: [Int], max: Int, sales: [Int]) {
    // 이모티콘의 할인가격 조합 도출
    if index == max {
        // 해당 할인가격 조합의 이모티콘플러스 가입자 수와 판매액이 최댓값인지 비교
        getResultBySalesComb(arr)
        return
    }
    
    for sale in sales {
        dfs(index: index + 1, arr: arr + [sale], max: max, sales: sales)
    }
}

// 이모티콘플러스 가입자 수와 판매액 도출 후 최댓값인지 비교하는 메서드
func getResultBySalesComb(_ arr: [Int]) {
    var emtiplusCnt = 0
    var sum = 0
    
    for u in user {
        var userSum = 0
        
        for (index, p) in arr.enumerated() {
            // 유저의 기준비율에 맞는 이모티콘만 선별
            if p >= u[0] {
                userSum += calDiscountPrice(emoticon[index], p)
            }
        }
        
        // 유저의 기준가격을 넘긴다면 이모티콘 플러스 가입
        if userSum >= u[1] {
            emtiplusCnt += 1
        } else {
            sum += userSum
        }
    }
    
    // 현재 할인 비율 모음이 최대 이모티콘 플러스 가입자를 이끌어내는지 확인
    if emtiplusCnt > finalEmtiPlusCnt {
        finalEmtiPlusCnt = emtiplusCnt
        finalSum = sum
    } else if emtiplusCnt == finalEmtiPlusCnt {
        finalSum = sum > finalSum ? sum : finalSum
    }
}

// 이모티콘 할인 가격 계산 메서드
func calDiscountPrice(_ origin: Int, _ percent: Int) -> Int {
    return origin - ((origin / 100) * percent)
}
