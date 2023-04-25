//
//  22859_HTML 파싱.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/21.
//

import Foundation

func solution22859() {
    var html = readLine()!
    html = html.replacingOccurrences(of: "<main>", with: "")
    html = html.replacingOccurrences(of: "<div ", with: "\n")
    html = html.replacingOccurrences(of: "title=\"", with: "title : ")
    html = html.replacingOccurrences(of: "\">", with: "")
    html = html.replacingOccurrences(of: "<p>", with: "\n", options: .regularExpression)
    html = html.replacingOccurrences(of: "<[a-z]+(\\s+)?>", with: "", options: .regularExpression)
    html = html.replacingOccurrences(of: "</[a-z]+>", with: "", options: .regularExpression)
    html = html.trimmingCharacters(in: ["\n"])
    
    let h = html.components(separatedBy: .newlines)
    for i in h {
        let i = i.trimmingCharacters(in: [" "])
        print(i.replacingOccurrences(of: "  ", with: " "))
    }
}
