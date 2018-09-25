/*:
 # 141. Linked List Cycle
 
 Given a linked list, determine if it has a cycle in it.
 
 Follow up:
 Can you solve it without using extra space?
 
 func hasCycle(_ node: ListNode) -> Bool {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */


// Definition for a binary tree node.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  
  public init(_ val: Int) {
    self.val = val
  }
}


class Solution {
  
  func hasCycle(_ node: ListNode) -> Bool {
  
    var slowNode: ListNode? = node
    var fastNode: ListNode? = node.next
    
    while slowNode != nil {
      
      if slowNode === fastNode {
        return true
      }
      
      slowNode = slowNode?.next
      fastNode = fastNode?.next?.next
    }
    
    return false
  }
  
}






/*:
 ## Test
 */
import XCTest

class TestLinkedListCycle: XCTestCase {
  
  func testLinkedListCycle1() {
    
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    let node6 = ListNode(6)
    
    // n1 -> n2 -> n3 -> n4 -> n5 -> n6
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    
    let result = Solution().hasCycle(node1)
    XCTAssertEqual(result, false)
    
  }
  
  func testLinkedListCycle2() {
    
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    let node6 = ListNode(6)
    
    /*
      n1 -> n2 -> n3 -> n4
                  ^     |
                  |     v
                  n6 <- n5
     
    */
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node3
    
    let result = Solution().hasCycle(node1)
    XCTAssertEqual(result, true)
    
  }
  
  
}

TestLinkedListCycle.defaultTestSuite.run()
