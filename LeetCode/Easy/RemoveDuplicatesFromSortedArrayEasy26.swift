class SolutionRemoveDuplicatesFromSortedArrayEasy26 {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    nums = Array(Set(nums)).sorted()
    return nums.count
  }
}

//var input = [0,0,1,1,1,2,2,3,3,4]
//SolutionRemoveDuplicatesFromSortedArrayEasy26().removeDuplicates(&input)
