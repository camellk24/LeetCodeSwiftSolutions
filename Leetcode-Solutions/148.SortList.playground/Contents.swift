/*:
 # 148. Sort List
 
 Sort a linked list in O(n log n) time using constant space complexity.
 
 Example 1:
 
 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:
 
 Input: -1->5->3->4->0
 Output: -1->0->3->4->5
 
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
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
  func sortList(_ head: ListNode?) -> ListNode? {
    
    guard head != nil && head?.next != nil else {
      return head
    }
    
    // find middle
    let mid = findMiddle(head)
    
    // sort right
    let right = sortList(mid?.next)
    
    // disconnect mid
    mid?.next = nil
    
    // sort left
    let left = sortList(head)
    
    // merge left and right
    return merge(left, right)
  }
  
  private func findMiddle(_ head: ListNode?) -> ListNode? {
    var slow: ListNode? = head
    var fast: ListNode? = head?.next
    
    while (fast != nil && fast!.next != nil) {
      fast = fast!.next!.next
      slow = slow?.next
    }
    
    return slow
  }
  
  private func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
    
    let dummy = ListNode(0)
    var curr: ListNode? = dummy
    var h1: ListNode? = head1
    var h2: ListNode? = head2
    
    while h1 != nil && h2 != nil {
      if h1!.val < h2!.val {
        curr?.next = h1
        h1 = h1!.next
      } else {
        curr?.next = h2
        h2 = h2!.next
      }
      curr = curr?.next
    }
    
    if h1 != nil {
      curr?.next = h1
    } else {
      curr?.next = h2
    }
    
    return dummy.next
  }
}




/*:
 ## Test
 */
import XCTest

class TestSortList: XCTestCase {
  
  func testSortList() {
    let node4 = ListNode(4)
    let node2 = ListNode(2)
    let node1 = ListNode(1)
    let node3 = ListNode(3)
    
    node4.next = node2
    node2.next = node1
    node1.next = node3
    
    let solution = Solution()
    let sorted = solution.sortList(node4)
    XCTAssertEqual(listToArray(sorted), [1, 2, 3, 4])
  }
  
  func testSortList1() {
    let node_1 = ListNode(-1)
    let node5 = ListNode(5)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node0 = ListNode(0)
    
    node_1.next = node5
    node5.next = node3
    node3.next = node4
    node4.next = node0
    
    let solution = Solution()
    let sorted = solution.sortList(node_1)
    XCTAssertEqual(listToArray(sorted), [-1, 0, 3, 4, 5])
  }
  
  private func listToArray(_ head: ListNode?) -> [Int] {
    var res: [Int] = []
    var node = head
    while node != nil {
      res.append(node!.val)
      node = node?.next
    }
    return res
  }
  
}

TestSortList.defaultTestSuite.run()
