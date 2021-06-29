import Foundation

func solution카펫(_ brown:Int, _ yellow:Int) -> [Int] {
  let answer = brown + yellow
  
  for w in 3...5000 {
    for h in 1...5000 where w >= h {
        if w * h == answer {
          if (w-2) * (h-2) == yellow {
            return [w, h]
          }
        }
    }
  }
  return []
}

//solution(24, 24)
