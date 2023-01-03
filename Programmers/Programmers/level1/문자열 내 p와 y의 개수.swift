//
//  문자열 내 p와 y의 개수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/04.
//

import Foundation

func solution(s:String) -> Bool
{
    let ycount = s.filter({ $0 == "y" || $0 == "Y" }).count
    let pcount = s.filter({ $0 == "p" || $0 == "P" }).count

    return ycount == pcount
}
