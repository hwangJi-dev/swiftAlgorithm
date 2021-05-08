//
//  main.swift
//  ArraynDictionaryPractice
//
//  Created by 황지은 on 2021/05/09.
//

import Foundation

let array: [String] = ["one", "two", "three", "four", "five"]
var keyArray:[[Int]] = Array(repeating: Array(repeating: 0, count: array.count), count: array.count)
var dic : [Int:String] = [:]
for (index, x) in array.enumerated() {
    print("인덱스: ", index+1)
    print("요소: ", x)
    dic.updateValue(x, forKey: index + 1)
}
let sortedDic = dic.sorted { $0.0 < $1.0 }
print(sortedDic)

var sortedArray: [Int] = []
for i in 0...sortedDic.count - 1 {
    print(sortedDic[i].key)
    sortedArray.append(sortedDic[i].key)
}
print(sortedArray)

