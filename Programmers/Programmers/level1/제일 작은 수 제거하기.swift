//
//  제일 작은 수 제거하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution(arr:[Int]) -> [Int] {
    var arr = arr
    var sortArr = arr.sorted(by: >)
    let index = arr.firstIndex(of: sortArr.removeLast())!
    arr.remove(at: index)
    return arr == [] ? [-1] : arr
}
