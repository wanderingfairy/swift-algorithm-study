import Foundation

public struct BinarySearchTree<Element: Comparable> {
  
  public private(set) var root: BinaryNode<Element>?
  
  public init() {}
  
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    guard let root = root else {
      return "empty tree"
    }
    return String(describing: root)
  }
}

extension BinarySearchTree {
  
  public mutating func insert(_ value: Element) {
    root = insert(from: root, value: value)
  }
  
  private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
    // 1
    guard let node = node else {
      return BinaryNode(value: value)
    }
    // 2
    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }
    // 3
    return node
  }
}

extension BinarySearchTree {
  public func contains(_ value: Element) -> Bool {
    guard let root = root else {
      return false
    }
    var found = false
    root.traverseInOrder {
      if $0 == value {
        found = true
      }
    }
    return found
  }
}

private extension BinaryNode {
  var min: BinaryNode {
    leftChild?.min ?? self
  }
}

extension BinarySearchTree {
  
  public mutating func remove(_ value: Element) {
    root = remove(node: root, value: value)
  }
  
  private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
    guard let node = node else {
      return nil
    }
    if value == node.value {
      // 1
      if node.leftChild == nil && node.rightChild == nil {
        return nil
      }
      // 2
      if node.leftChild == nil {
        return node.rightChild
      }
      // 3
      if node.rightChild == nil {
        return node.leftChild
      }
      // 4
      node.value = node.rightChild!.min.value
      node.rightChild = remove(node: node.rightChild, value: node.value)
    } else if value < node.value {
      node.leftChild = remove(node: node.leftChild, value: value)
    } else {
      node.rightChild = remove(node: node.rightChild, value: value)
    }
    return node
  }
}
