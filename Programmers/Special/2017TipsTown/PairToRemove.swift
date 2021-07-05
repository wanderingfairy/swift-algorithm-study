import Foundation

func solution짝지어제거하기(_ s:String) -> Int {
  if s.count <= 1 {
    return 0
  }
  
  var stack: [String.Element] = s.map { $0 }.reversed()
  var removedStack = [String.Element]()
  
  while stack.count > 0 {
    if stack.count == 1 {
      if removedStack.isEmpty {
        return 0
      }
    }
    var a = stack.popLast()!
    var b: String.Element?
    
    if !removedStack.isEmpty {
      b = removedStack.popLast()!
    } else {
      b = a
      a = stack.popLast()!
    }
    
    if a != b {
      removedStack.append(b!)
      removedStack.append(a)
    }
  }
  
  if removedStack.count == 0 { return 1 } else { return 0 }
}

//solution("abccba")
//solution("abcccba")
//solution("abccccbaaa")
//solution("abccaabaa")
//solution("a")

