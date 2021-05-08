//
//  main.swift
//  ReadLineTest
//
//  Created by 황지은 on 2021/05/08.
//

import Foundation

var nums:[Int] = [1,2,5,6,7]
var answer = 0
var addSums:[Int] = []

for i in 0...nums.count - 3 {
    for j in (i+1)...nums.count - 2 {
        for k in (j+1)...nums.count - 1{
            addSums.append(nums[i] + nums[j] + nums[k])
        }
    }
}

var sosu:[Int] = []
for i in 0...addSums.count - 1 {
    for j in 1...addSums[i]  {
        if addSums[i] % j == 0 {
            sosu.append(j)
        }
    }
    if sosu.count == 2 {
        answer += 1
    }
    sosu.removeAll()
}


print(answer)

