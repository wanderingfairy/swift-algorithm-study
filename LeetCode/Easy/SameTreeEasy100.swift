
// Definition for a binary tree node.
//public class TreeNode {
//  public var val: Int
//  public var left: TreeNode?
//  public var right: TreeNode?
//  public init() { self.val = 0; self.left = nil; self.right = nil; }
//  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//    self.val = val
//    self.left = left
//    self.right = right
//  }
//}

extension TreeNode {
  func traverse(tree: TreeNode, visit: @escaping ((Int) -> Void)) {
    visit(val)
    if let left = left {
      left.traverse(tree: tree, visit: visit)
    } else {
      visit(-1)
    }
    
    if let right = right {
      right.traverse(tree: tree, visit: visit)
    } else {
      visit(-1)
    }
  }
}

class Solution {
  func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
      return true
    }
    
    guard let p = p, let q = q else {
      return false
    }
    
    var pShape = [Int]()
    p.traverse(tree: p) {
      pShape.append($0)
    }
    var qShape = [Int]()
    q.traverse(tree: q) {
      qShape.append($0)
    }
    
    return pShape == qShape
  }
}
