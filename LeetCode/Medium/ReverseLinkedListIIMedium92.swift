//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
      
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var node: ListNode? = head
    
    var index = 1
    while index < left && node != nil {
      prev = node
      node = node!.next
      index += 1
    }

    let leftTail: ListNode! = prev
    let rightHead: ListNode? = node
    
    var next: ListNode?
    while index <= right && node != nil {
      next = node!.next
      node!.next = prev
      prev = node
      node = next
      index += 1
    }
    
    leftTail.next = prev
    rightHead?.next = node
    
    return dummy.next
  }
}


//let five = ListNode(5)
//let four = ListNode(4, five)
//let three = ListNode(3, four)
//let two = ListNode(2, three)
//let one = ListNode(1, two)
//Solution().reverseBetween(one, 2, 4)
