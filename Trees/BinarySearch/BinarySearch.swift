import Foundation

public extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    // 1
    let range = range ?? startIndex..<endIndex
    // 2
    guard range.lowerBound < range.upperBound else {
      return nil
    }
    // 3
    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)
    
    // 4
    if self[middle] == value {
      return middle
      // 5
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}
