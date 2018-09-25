/*:
 # Find kth Last Node in List
 */


//  Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int, _ next: ListNode? = nil) {
    self.val = val
    self.next = next
  }
}


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {

  func findKthLastNodesInList(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    guard let head = head, k > 0  else {
      return nil
    }
    
    var curr: ListNode? = head
    var nBehind: ListNode? = head
    
    for _ in 0 ..< k - 1 {
      if curr?.next == nil {
        return nil
      }
      curr = curr?.next
    }
    
    while curr?.next != nil {
      curr = curr?.next
      nBehind = nBehind?.next
    }
    
    return nBehind
  }
  
}




/*:
 ## Test
 */
import XCTest

class TestCopyRandomList: XCTestCase {
  
  func testCopyRandomList() {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    
    let solution = Solution()
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 1) === node4, true)
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 2) === node3, true)
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 3) === node2, true)
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 4) === node1, true)
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 5) === nil, true)
    XCTAssertEqual(solution.findKthLastNodesInList(node1, 0) === nil, true)
  }
  
}

TestCopyRandomList.defaultTestSuite.run()
