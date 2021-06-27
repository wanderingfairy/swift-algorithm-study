import Foundation

func solutionMemoization(_ numbers:[Int], _ target:Int) -> Int {
  let numbersCopy = numbers
  let target = target
  
  var dict: [String:Int]  = [:] //메모이제이션
    
  func dfs(depth: Int, current: Int) -> Int {
    if (dict["\(depth)-\(current)"] != nil) {
      return dict["\(depth)-\(current)"]!
    }

    if depth == numbersCopy.count {
      if current == target {
        return 1
      }
      return 0
    }
    let nextValue = numbersCopy[depth]
    let a = dfs(depth: depth + 1, current: current + nextValue)
    let b = dfs(depth: depth + 1, current: current - nextValue)
 
    dict["\(depth)-\(current)"] = a + b
    return a + b
  }
  
  return dfs(depth: 0, current: 0)
}
