import Foundation

func solution음양더하기(_ absolutes:[Int], _ signs:[Bool]) -> Int {
  return zip(absolutes, signs)
          .map { (num, sign) -> Int in
                  sign ? num : -num
                }
          .reduce(0, +)
}

//solution([4, 7, 12], [true, false, true])
