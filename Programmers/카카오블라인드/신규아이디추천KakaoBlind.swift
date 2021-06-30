import Foundation

func solution신규아이디추천(_ new_id:String) -> String {
  var id = new_id.lowercased().filter { c -> Bool in
    [1,2,3,4,5,6,7,8,9,0].map { String($0) }.contains(String(c)) ||
      ["-", "_", "."].contains(c) || c.isLowercase
  }
  
  while id.contains("...") || id.contains("..") {
    id = id.replacingOccurrences(of: "...", with: ".")
    id = id.replacingOccurrences(of: "..", with: ".")
  }
  
  if id.first == "." { id.removeFirst() }
  if id.last == "." { id.removeLast() }
  if id == "" { id = "a"}
  if id.count >= 16 { id = String(id[id.startIndex...id.index(id.startIndex, offsetBy: 14)])}
  if id.last == "." { id.removeLast() }
  if id.count <= 2 { }
  
  if id.count <= 2 && id.count > 0 {
    while id.count != 3 {
      id.append(id.last!)
    }
  }
    return id
}

//solution("...!@BaT#*..y.abcdefghijklm")
