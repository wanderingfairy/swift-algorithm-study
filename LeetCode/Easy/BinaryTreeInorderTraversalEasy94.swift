// Definition for a binary tree node.
//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}

extension TreeNode {
  func traverse(visit: (Int) -> Void) {
    left?.traverse(visit: visit)
    visit(val)
    right?.traverse(visit: visit)
  }
}

class SolutionInorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
      var result = [Int]()
      root?.traverse(visit: { value in
        result.append(value)
      })
        return result
    }
}

//let rootRL = TreeNode(3)
//let rootR = TreeNode(2, rootRL, nil)
//let rootL: TreeNode? = nil
//let root = TreeNode(1, rootL, rootR)

//SolutionInorderTraversal().inorderTraversal(root)
