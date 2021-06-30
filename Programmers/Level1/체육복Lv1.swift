import Foundation

func solution체육복(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
  var lostCopy = lost.filter { !reserve.contains($0) }
  let reserveAfterLost = reserve.filter { !lost.contains($0) }
  
  for r in reserveAfterLost {
    if lostCopy.contains(r-1) {
      lostCopy = lostCopy.filter({$0 != r-1})
      continue
    }
    
    if lostCopy.contains(r+1) {
      lostCopy = lostCopy.filter({$0 != r+1})
    }
  }
  
  return n - lostCopy.count
}

//solution(5, [1, 2, 3], [2, 3, 4])
