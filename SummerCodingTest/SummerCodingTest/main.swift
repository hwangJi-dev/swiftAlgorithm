//
//  main.swift
//  SummerCodingTest
//
//  Created by 황지은 on 2021/05/09.
//

import Foundation

struct jusik {
    var price:String
    var companyCode:String
    var timme:String
}

var code:String = "012345"
var day:String = "20190620"
var data:[String] = ["price=80 code=987654 time=2019062113","price=90 code=012345 time=2019062014","price=120 code=987654 time=2019062010","price=110 code=012345 time=2019062009","price=95 code=012345 time=2019062111"]
var dataArr:[[String]] = []
var jusikArray:[jusik] = []
var AnserArray:[Int] = []

// 특정 코드(code)에 해당되는 특정 기업의 주가 데이터(price)만 뽑아 시간 순 [날짜(day)]으로 정렬해 return

for i in 0...data.count - 1 {
    dataArr.append(contentsOf: [data[i].components(separatedBy: " ")])
}

var codeFilterArr:[[String]] = []

for i in 0...dataArr.count - 1 {
    if dataArr[i][1] == "code=\(code)" {
        codeFilterArr.append(dataArr[i])
    }
}

for i in 0...codeFilterArr.count - 1 {
    let firstIndex = codeFilterArr[i][2].index(dataArr[i][2].startIndex, offsetBy: 5)
    let lastIndex = codeFilterArr[i][2].index(dataArr[i][2].startIndex, offsetBy: 13)
    let timeLastIndex = codeFilterArr[i][2].index(dataArr[i][2].startIndex, offsetBy: 15)
    let string = codeFilterArr[i][2]
    let realTimeString = codeFilterArr[i][2][firstIndex..<timeLastIndex]
    if string[firstIndex..<lastIndex] == day {
        print(string[firstIndex..<lastIndex])
        jusikArray.append(jusik(price: codeFilterArr[i][0], companyCode: dataArr[i][1], timme: String(realTimeString)))
    }
}
jusikArray = jusikArray.sorted{($0.timme) < ($1.timme)}

for i in 0...jusikArray.count - 1 {
    AnserArray.append(Int(jusikArray[i].price.filter{$0.isNumber})!)
}

