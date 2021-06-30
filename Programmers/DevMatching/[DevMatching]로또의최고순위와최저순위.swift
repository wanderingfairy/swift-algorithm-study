import Foundation

func check(_ correctedNumCount: Int) -> Int {
  switch correctedNumCount {
  case 0, 1:
    return 6
  case 2:
    return 5
  case 3:
    return 4
  case 4:
    return 3
  case 5:
    return 2
  default:
    return 1
  }
}

func solution로또최고순위와최저순위(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
  var selected = lottos.filter { $0 != 0 }
  let unknownNumCount = 6 - selected.count
  var unselectedWinNum = [Int]()
  var worst = 0
  var best = 0
  
  if unknownNumCount == 0 {
    worst = check(selected.filter { win_nums.contains($0) }.count)
    return [worst, worst]
  }
  
  for i in win_nums {
    if !selected.contains(i) {
      unselectedWinNum.append(i)
    }
  }
  
  worst = check(selected.filter { win_nums.contains($0) }.count)
  
  for j in 0..<unknownNumCount {
    selected.append(unselectedWinNum[j])
  }
  
  best = check(selected.filter{ win_nums.contains($0) }.count)

  return [best, worst]
}


//solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35])
