import Foundation

class SolutionTwoSumEasy1 {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    let sortedNums = nums.sorted()
    var pre = 0
    var post = nums.count - 1
    
    while pre < post {
      
      if sortedNums[pre] + sortedNums[post] < target {
        pre += 1
        continue
      }
      
      if sortedNums[pre] + sortedNums[post] > target {
        post -= 1
        continue
      }
      break
    }
    
    return [nums.firstIndex(of: sortedNums[pre])!,
            nums.lastIndex(of: sortedNums[post])!]
  }
}

//SolutionTwoSumEasy1().twoSum([2, 7, 11, 15], 9)
