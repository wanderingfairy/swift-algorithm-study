import Foundation

func solution내적(_ a:[Int], _ b:[Int]) -> Int {
  return zip(a, b).reduce(0) { prev, next in
    prev + next.0 * next.1
  }
}

//solution([-1,0,1], [1,0,-1])
