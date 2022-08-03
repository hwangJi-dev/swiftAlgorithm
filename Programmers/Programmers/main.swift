//
//  main.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

//print(solution2([1, 2, 3]))

var attention = "abcabcabcabcdededededede"
var result = ""
var arr: [String] = []

for i in 1...5 {
    let list = Array(attention)
    
    for j in stride(from: 0, through: list.count - 1, by: i) {
        if list.count % i == 0 {
            arr.append(String(attention[String.Index(utf16Offset: j, in: attention)...String.Index(utf16Offset: j + i - 1, in: attention)]))
        }
    }
    
    var temp = ""
    var tempArr: [String] = []
    print(arr)
    for l in arr {
        if l != temp {
            tempArr.append(l)
        } else {
            tempArr.removeLast()
            tempArr.append("*" + l)
        }
        
        temp = l
    }
//
//    print("temp", tempArr)
//    print("temCnt", tempArr.count)
    print("finalStr", tempArr.joined(separator: ""))
    print("finalCnt", tempArr.joined(separator: "").count)
    arr = []
}

//for index in attention.indices {
//    for i in 1...5 {
//        arr.append(contentsOf: attention)
//        print(attention[index])
//    }
//}

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
