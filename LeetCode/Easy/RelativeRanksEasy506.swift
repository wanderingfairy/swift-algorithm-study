import Foundation

class SolutionRelativeRanksEash506 {
    func findRelativeRanks(_ score: [Int]) -> [String] {
      var dict: [Int: String] = [:]
      
      for (idx, s) in score.sorted(by: >).enumerated() {
        if idx == 0 {
          dict[s] = "Gold Medal"
        }
        else if idx == 1 {
          dict[s] = "Silver Medal"
        }
        else if idx == 2 {
          dict[s] = "Bronze Medal"
        } else {
          dict[s] = "\(idx+1)"
        }
      }
      return score.map { dict[$0]! }
    }
}

//SolutionRelativeRanksEash506().findRelativeRanks([10,3,8,9,4])
