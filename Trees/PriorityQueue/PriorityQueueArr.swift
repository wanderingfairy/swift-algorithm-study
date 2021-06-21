import Foundation

struct PriorityQueueArr<Element: Equatable>: Queue {
  
  private var array: Array<Element>
  private var sort: (Element, Element) -> Bool
  
  init(sort: @escaping (Element, Element) -> Bool,
       elements: [Element] = []) {
    self.sort = sort
    self.array = elements
    self.array.sort(by: sort)
  }
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var peek: Element? {
    return array.first
  }
  
  mutating func enqueue(_ element: Element) -> Bool {
    for (idx, otherElem) in array.enumerated() {
      if sort(element, otherElem) {
        array.insert(element, at: idx)
        return true
      }
    }
    array.append(element)
    return true
  }
  
  mutating func dequeue() -> Element? {
    isEmpty ? nil : array.removeFirst()
  }
}
