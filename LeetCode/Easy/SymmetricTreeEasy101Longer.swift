//Definition for a binary tree node.
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
    if root?.right == nil && root?.left == nil {
      return true
    }

    var tempL: [Int?] = []
    var tempR: [Int?] = []

    func lTraverse(node: TreeNode?) {
      tempL.append(node?.val)

      if node?.left == nil && node?.right == nil {
        return
      }
      lTraverse(node: node?.left)
      lTraverse(node: node?.right)
    }

    func rTraverse(node: TreeNode?) {
      tempR.append(node?.val)

      if node?.left == nil && node?.right == nil {
        return
      }
      rTraverse(node: node?.right)
      rTraverse(node: node?.left)
    }

    lTraverse(node: root?.left)
    rTraverse(node: root?.right)

    if (tempL.count + tempR.count) % 2 == 0 {
      return tempL == tempR
    }

    return false
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
