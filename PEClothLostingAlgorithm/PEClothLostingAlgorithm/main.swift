//
//  main.swift
//  PEClothLostingAlgorithm
//
//  Created by 황지은 on 2021/05/09.
//

import Foundation

var n:Int = 10
var lost:[Int] = [1, 2, 3, 7]
var reverse:[Int] = [1, 2, 5, 10]
var student:[Int] = []
var result:Int = 0


//
//for i in 0...reverse.count - 1 {
//    for j in 0...lost.count - 1 {
//        student.remove(at: <#T##Int#>)
//        if reverse[i] == lost[j] {
//            print(reverse[i])
//
//            reverse[i] = -1
//        }
//
////        if lost[j] == reverse[i] - 1 || lost[j] == reverse[i] + 1 {
////            reverse[i] = -1
////            lost[j] = -1
////            result += 1
////        }
//    }
//}
//
//for i in 0...reverse.count - 1 {
//    for j in 0...lost.count - 1 {
//
//        if lost[j] == reverse[i] - 1 || lost[j] == reverse[i] + 1 {
//            reverse[i] = -1
//            lost[j] = -1
//            result += 1
//        }
//    }
//}

print(result)
print(n - lost.count + result)
