//
//  가운데 글자 가져오기.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

func solutions1(_ s:String) -> String {

    if s.count % 2 == 0 {
        let index = s.index(s.startIndex, offsetBy: s.count / 2 - 1)..<s.index(s.startIndex, offsetBy: s.count / 2 + 1)
        return String(describing: s[index])
    } else {
        let index = s.index(s.startIndex, offsetBy: s.count / 2)
        return String(describing: s[index])
    }
}

func solutions2(_ s:String) -> String {
    return String(s[String.Index(utf16Offset: (s.count - 1) / 2, in: s)...String.Index(utf16Offset: s.count / 2, in: s)])
}
