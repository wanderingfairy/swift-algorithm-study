
//Definition for singly-linked list.
//public class ListNode {
//  public var val: Int
//  public var next: ListNode?
//  public init() { self.val = 0; self.next = nil; }
//  public init(_ val: Int) { self.val = val; self.next = nil; }
//  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}

extension ListNode {
  func traversal() {
    print(val)
    next?.traversal()
  }
}


class SolutionAddTwoNumbers {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    guard let l = l1, let r = l2 else {
      return nil
    }
    
    var pass = 0
    
    var resultNode: ListNode? = nil
    var last: ListNode? = nil
    
    var lCurrent: ListNode? = l
    var rCurrent: ListNode? = r
    
    var sum = (lCurrent?.val ?? 0) + (rCurrent?.val ?? 0)
    
    if sum > 9 {
      pass += 1
      sum -= 10
      
      resultNode = ListNode(sum, nil)
      last = resultNode
    } else {
      resultNode = ListNode(sum, nil)
      last = resultNode
    }
    
    lCurrent = lCurrent?.next
    rCurrent = rCurrent?.next
    
    while lCurrent != nil || rCurrent != nil {
      
      sum = (lCurrent?.val ?? 0) + (rCurrent?.val ?? 0) + pass
      
      pass = 0
      
      if sum > 9 {
        pass += 1
        sum -= 10
      }
      
      lCurrent = lCurrent?.next
      rCurrent = rCurrent?.next
      
      last?.next = ListNode(sum, nil)
      last = last?.next
    }
    
    if pass > 0{
      last?.next = ListNode(pass)
    }
    return resultNode
  }
}

//let root7 = ListNode(9, nil)
//let root6 = ListNode(9, root7)
//let root5 = ListNode(9, root6)
//let root4 = ListNode(9, root5)
//let root3 = ListNode(9, root4)
//let root2 = ListNode(9, root3)
//let root1 = ListNode(9, root2)
//
//
//let root11 = ListNode(9, nil)
//let root10 = ListNode(9, root11)
//let root9 = ListNode(9, root10)
//let root8 = ListNode(9, root9)

//Solution().addTwoNumbers(root1, root8)
