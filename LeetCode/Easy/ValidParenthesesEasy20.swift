class Solution {
  func isValid(_ s: String) -> Bool {
    var brakets: [String.Element] = []
    
    for char in s {
      switch char {
      case ")":
        if brakets.isEmpty || brakets.removeLast() != "(" { return false }
      case "}":
        if brakets.isEmpty || brakets.removeLast() != "{" { return false }
      case "]":
        if brakets.isEmpty || brakets.removeLast() != "[" { return false }
      default:
        brakets.append(char)
      }
    }
    
    return brakets.isEmpty
  }
}

//Solution().isValid("([)]")
