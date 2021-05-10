//
//  main.swift
//  SummerCodingTest2
//
//  Created by 황지은 on 2021/05/09.
//

import Foundation

var t :[Int] = [0,1,3,0]
var r :[Int] = [0,1,2,3]
var liftMaxNum:Int = 0
var peopleCnt:Int = 0
var indexArr:[Int] = []
var resultArr:[Int] = []

for _ in 0...t.count - 1 {
    peopleCnt+=1
}

for i in 0...t.count - 1 {
    if t[i] > liftMaxNum {
        liftMaxNum = t[i]
    }
}
for i in 0...liftMaxNum {
    for j in 0...peopleCnt - 1 {
        if t[j] == i {
            indexArr.append(j)
        }
    }
}
for k in 0...indexArr.count - 1 {
    var minR = 0
    if r[k] < minR {
        minR = r[k]
        resultArr.append(r[k])
    }
    else {
        resultArr.append(r[k])
    }
}
print(resultArr.sorted())



