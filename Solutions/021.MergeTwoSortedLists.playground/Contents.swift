/*:
 # 21. Merge Two Sorted Lists
 
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 
 
 **Implement below function**
 
 func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
 
 }
 
 */

/*:
 DFS
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let dummy = ListNode(0)
    var lastNode: ListNode? = dummy
    var l1: ListNode? = l1
    var l2: ListNode? = l2
    
    while (l1 != nil && l2 != nil) {
      
      if l1!.val < l2!.val {
        lastNode?.next = l1
        l1 = l1!.next
      } else {
        lastNode?.next = l2
        l2 = l2!.next
      }
      
      lastNode = lastNode?.next
    }
    
    if let l1 = l1 {
      lastNode?.next = l1
    } else {
      lastNode?.next = l2
    }
    
    return dummy.next
    
  }
}


/*:
 ## Test
 */
import XCTest

class TestMergeTwoSortedLists: XCTestCase {
  
  func testMergeTwoSortedLists() {
    // linked list 1
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node4 = ListNode(4)
    
    node1.next = node2
    node2.next = node4
    
    // linked list 2
    let nodeOne = ListNode(1)
    let nodeThree = ListNode(3)
    let nodeFour = ListNode(4)
    
    nodeOne.next = nodeThree
    nodeThree.next = nodeFour
    
    let solution = Solution()
    let result = solution.mergeTwoLists(node1, nodeOne)
    var resultArray: [Int] = []
    var node: ListNode? = result
    while node != nil {
      resultArray.append(node!.val)
      node = node?.next
    }
    XCTAssertEqual(resultArray, [1, 1, 2, 3, 4, 4])
      
  }
  
}

TestMergeTwoSortedLists.defaultTestSuite.run()
