//
//  마법의 엘리베이터.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/08.
//

import Foundation

//func solution(storey:Int) -> Int {
//    var cipher = String(storey).count - 1
//    var temp = storey
//    var arr: [Int] = []
//    var result = 0
//
//    while cipher >= 0 {
//        arr.append(temp / Int(pow(10.0, Double(cipher))))
//        temp = temp % Int(pow(10.0, Double(cipher)))
//        cipher -= 1
//    }
//
//    cipher = 0
//    arr = arr.reversed()
//
//    for (index, _) in arr.enumerated() {
//        if index < arr.count - 1 && arr[index] == 5 && arr[index + 1] <= 5 {
//            result += arr[index]
//        } else if arr[index] >= 5 {
//            result += 10 - arr[index]
//            arr[index] = 0
//            if index < arr.count - 1 {
//                arr[index + 1] += 1
//            } else {
//                result += 1
//            }
//        } else {
//            result += arr[index]
//        }
//    }
//
//    return result
//}


func solution(storey: Int) -> Int {
    var storey = storey
    var result = 0
    var temp = 0

    while storey != 0 {
        if storey <= 10 && storey >= 5 {
            if storey == 10 {
                result += 1
            } else {
                result += temp >= 5 ? 11 - storey : storey
            }
            storey = 0
        } else if storey % 10 > 5 || (storey % 10 >= 5 && (storey / 10) % 10 >= 5) {
            temp = storey % 10
            result += 10 - (storey % 10)
            storey = (storey / 10) + 1
        } else {
            temp = storey % 10
            result += storey % 10
            storey = storey / 10
        }
    }

    return result
}
