func solution타겟넘버Lv2(_ numbers:[Int]) -> String {

  if numbers.count == 1 {
    return String(numbers.first!)
  }

  func sort(a: Int, b: Int) throws -> Bool {
    let a = String(a)
    let b = String(b)
    return Int(a + b)! < Int(b + a)!
  }

  var minPriorityQueue: [Int] = try! numbers.sorted(by: sort)
  var result: String = ""

  if minPriorityQueue.last == 0 {
    return "0"
  }
  
  while !minPriorityQueue.isEmpty {
    result += String(minPriorityQueue.popLast()!)
  }

  return String(result)
}

//solution타겟넘버Lv2([3, 30, 34, 5, 9])
