//
//  문자열 압축.swift
//  Programmers1
//
//  Created by hwangJi on 2022/08/04.
//

import Foundation

func solution(_ s:String) -> Int {
    var resultCnt: Int = 1000
   
    for i in 1..<s.count + 1 {
        let arr: [String] = s.split(by: i)
        var temp: String = ""
        var count: Int = 1
        var resultArr: [String] = []
        
        for j in arr {
            if temp == j {
                count += 1
                resultArr.removeLast()
                resultArr.append("\(count)" + j)
            } else {
                count = 1
                resultArr.append(j)
            }
            temp = j
        }
        
        if resultCnt > resultArr.joined().count {
            resultCnt = resultArr.joined().count
        }
    }
    
    return resultCnt
}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
