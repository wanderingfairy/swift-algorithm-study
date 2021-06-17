import Foundation

public func partitionHoare<T: Comparable>(_ a: inout [T],
                                          low: Int, high: Int) -> Int {
  let pivot = a[low]
  var i = low - 1
  var j = high + 1
  while true {
    repeat { j -= 1 } while a[j] > pivot
    repeat { i += 1 } while a[i] < pivot
    
    if i < j {
      a.swapAt(i, j)
    } else {
      return j
    }
  }
}

public func quicksortHoare<T: Comparable>(_ a: inout [T],
                                          low: Int, high: Int) {
  if low < high {
    let pivot = partitionHoare(&a, low: low, high: high)
    
    quicksortHoare(&a, low: low, high: pivot)
    quicksortHoare(&a, low: pivot + 1, high: high)
  }
}
