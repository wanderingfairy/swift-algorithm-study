import Foundation

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  
  func isSymmetric(_ root: TreeNode?) -> Bool {
    return isSymmetricTree(root, root)
  }
  
  func isSymmetricTree(_ tree1: TreeNode?, _ tree2: TreeNode?) -> Bool {
    if tree1 == nil && tree2 == nil { return true }
    guard let tree1 = tree1 else { return false }
    guard let tree2 = tree2 else { return false}
    
    if tree1.val != tree2.val { return false }
    
    return isSymmetricTree(tree1.left, tree2.right) &&
           isSymmetricTree(tree1.right, tree2.left)
  }
}

let oneRR = TreeNode(3)
let oneRL: TreeNode? = nil
let oneR = TreeNode(2, oneRL, oneRR)

let oneLL: TreeNode? = nil
let oneLR = TreeNode(3)
let oneL = TreeNode(2, oneLL, oneLR)

let root = TreeNode(1, oneL, oneR)

/*
                         one1
               oneL2             oneR2
          oneLLnil  oneLR3    oneRLnil oneRR3
*/

//Solution().isSymmetric(root)


