import Foundation

func solution2(_ survey:[String], _ choices:[Int]) -> String {
    let personality: [String] = ["RT", "CF", "JM", "AN"]
    var personalityScore: [Int] = [0, 0, 0, 0]
    var result: String = ""
    
    for (index, i) in survey.enumerated() {
        let type = String(choices[index] < 4 ? i.first! : i.last!)
        for (idx, j) in personality.enumerated() {
            if j.contains(type) {
                personalityScore[idx] += type == String(j.first!) ? -abs(choices[index] - 4) : abs(choices[index] - 4)
            }
        }
    }
    
    for (index, score) in personalityScore.enumerated() {
        result += score <= 0 ? String(personality[index].first!) : String(personality[index].last!)
    }
    
    return result
}

// 더 효율적인 방법
func solution3(_ survey:[String], _ choices:[Int]) -> String {
    var personalityDict: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var result: String = ""
    
    for (index, i) in survey.enumerated() {
        personalityDict[choices[index] < 4 ? String(i.first!) : String(i.last!)]! += abs(choices[index] - 4)
    }
    
    result += personalityDict["R"]! >= personalityDict["T"]! ? "R" : "T"
    result += personalityDict["C"]! >= personalityDict["F"]! ? "C" : "F"
    result += personalityDict["J"]! >= personalityDict["M"]! ? "J" : "M"
    result += personalityDict["A"]! >= personalityDict["N"]! ? "A" : "N"
    
    return result
}
