//
//  main.swift
//  1000_PrintPlus
//
//  Created by hwangJi on 2022/01/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[0] + input[1])
