import Foundation

public protocol Queue {
  
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
}

public struct QueueStack<T> : Queue {
  
  private var leftStack: [T] = []
  private var rightStack: [T] = []
  public init() {}
  
  public mutating func enqueue(_ element: T) -> Bool {
    rightStack.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    if leftStack.isEmpty {
      leftStack = rightStack.reversed()
      rightStack.removeAll()
    }
    return leftStack.popLast()
  }
}

func solution다리를지나는트럭(_ bridge_length:Int,
              _ weight:Int,
              _ truck_weights:[Int]) -> Int {
  var waitQueue: [Int] = truck_weights.reversed()
  var currentWeightInBridge = 0
  var time = 0
  var times = [Int]()
  var weights: QueueStack<Int> = .init()
  
  while !waitQueue.isEmpty {
    time += 1
    if !times.isEmpty {
      if time == times.first! {
        times.removeFirst()
        currentWeightInBridge -= weights.dequeue()!
      }
    }
    
    if currentWeightInBridge + waitQueue.last! <= weight {
      currentWeightInBridge += waitQueue.last!
      weights.enqueue(waitQueue.popLast()!)
      times.append(time+bridge_length)
    }
  }
  return times.last!
}

//solution(2, 10, [7,4,5,6])
