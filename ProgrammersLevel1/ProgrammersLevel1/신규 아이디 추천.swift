//
//  신규 아이디 추천.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

func solution(_ new_id:String) -> String {
    
    var changedId: String = ""
    
    // 1
    changedId = new_id.lowercased()
    
    // 2
    changedId = changedId.replacingOccurrences(of:"[^0-9a-z._-]", with:"", options: .regularExpression)
    
    // 3
    changedId = changedId.replacingOccurrences(of: "(\\.)\\1+", with:".", options: .regularExpression)
    
    // 4
    changedId = changedId.trimmingCharacters(in: ["."])
    
    // 5
    if changedId == "" {
        changedId = "a"
    }
    
    // 6
    if changedId.count >= 16 {
        let range = changedId.index(changedId.startIndex, offsetBy: 15)..<changedId.endIndex
        changedId.removeSubrange(range)
        changedId = changedId.trimmingCharacters(in: ["."])
    }
    
    // 7
    if changedId.count <= 2 {
        while changedId.count != 3 {
            if let lastChar = changedId.last {
                changedId.insert(contentsOf: String(lastChar), at: changedId.endIndex)
            }
        }
    }
    
    return changedId
}
