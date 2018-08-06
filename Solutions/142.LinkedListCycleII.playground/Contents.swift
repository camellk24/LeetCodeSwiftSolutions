/*:
 # 142. Linked List Cycle II
 
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
 
 Note: Do not modify the linked list.
 
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
  
  func detectCycle(_ node: ListNode) -> ListNode? {
    
    var slowNode: ListNode? = node
    var fastNode: ListNode? = node.next
    
    while slowNode != nil {
      
      if slowNode === fastNode {
        return slowNode
      }
      
      slowNode = slowNode?.next
      fastNode = fastNode?.next?.next
    }
    
    return nil
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
    
    let result = Solution().detectCycle(node1)
    XCTAssertNil(result)
    
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
    
    let result = Solution().detectCycle(node1)
    print("result: \(result?.val)")
    XCTAssertTrue(result === node3)
    
  }
  
  
}

TestLinkedListCycle.defaultTestSuite.run()
