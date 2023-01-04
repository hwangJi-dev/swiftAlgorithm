//
//  수박수박수박수박수박수?.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/05.
//

import Foundation

func solution1(n:Int) -> String {
    return n % 2 == 0 ? String(repeating: "수박", count: n / 2) : String(repeating: "수박", count: n / 2) + "수"
}
