func solutionHIndex(_ citations:[Int]) -> Int {
  for i in (0...citations.count).reversed() {
    if citations.filter({ $0 >= i }).count >= i {
      return i
    }
  }
  return 0
}

//solution([0, 1, 1])
