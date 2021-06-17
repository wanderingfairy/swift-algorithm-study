import Foundation

// MARK: - Array based implementation
public struct QueueArray<T>: Queue {
  public mutating func enqueue(_ element: T) -> Bool {
    array.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    isEmpty ? nil : array.removeFirst()
  }
  
  private var array: [T] = []
  public init() { }
  
  public var isEmpty: Bool {
    array.isEmpty
  }
  
  public var peek: T? {
    array.first
  }
}


extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}
