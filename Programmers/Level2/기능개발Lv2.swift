import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  var psDictStack: [(Int, Int)] = []
  
  let progressesR = progresses.reversed()
  let speedsR = speeds.reversed()
  
  var result = [Int]()
  
  zip(progressesR, speedsR).forEach { (p, s) in
    psDictStack.append((p,s))
  }
  
  
  while !psDictStack.isEmpty {
    var todayDeploy = 0
    
    for i in 0..<psDictStack.count {
      psDictStack[i].0 += psDictStack[i].1
    }
    
    while true {
      if !psDictStack.isEmpty && psDictStack.last!.0 >= 100 {
        psDictStack.popLast()
        todayDeploy += 1
        continue
      }
      break
    }
    
    if todayDeploy != 0 {
      result.append(todayDeploy)
    }
  }
  
  return result
}

//solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])
