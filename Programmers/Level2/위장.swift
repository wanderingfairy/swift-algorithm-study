import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var dict: Dictionary<String, [String]> = [:]
  
  for i in 0..<clothes.count {
    dict[clothes[i].last!] = (dict[clothes[i].last!] ?? []).map {
      var newValue = $0
      newValue.append(clothes[i].first!)
      return newValue
    }
  }
  
  let count = dict.mapValues({ $0.count }).values
  return count.reduce(1) { $0 * ($1 + 1)} - 1
}
