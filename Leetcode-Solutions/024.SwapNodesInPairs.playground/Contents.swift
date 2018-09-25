/*:
 # 24. Swap Nodes in Pairs
 
 Given a linked list, swap every two adjacent nodes and return its head.
 
 Example:
 
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 Note:
 
 Your algorithm should use only constant extra space.
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 func swapPairs(_ head: ListNode?) -> ListNode? {
 
 }
 
 */


/*:
 
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
  func swapPairs(_ head: ListNode?) -> ListNode? {
    
    // dummy -> n1 -> n2 -> n3 -> n4
    let dummyNode = ListNode(0)
    dummyNode.next = head
    
    var node: ListNode? = dummyNode
    
    while node != nil && node?.next != nil && node?.next?.next != nil  {
      
      // n1 -> n2 -> n3 ->
      
      let n1 = node!
      let n2 = n1.next!
      let n3 = n2.next!
      let temp: ListNode? = n3.next
      
      n1.next = n3
      n3.next = n2
      n2.next = temp
      
      node = n2
    }
    
    
    return dummyNode.next
  }
}

/*:
 ## Test
 */
import XCTest

class TestSwapPairs: XCTestCase {
  
  func getTestLinkedList() ->  ListNode {
    
    let n1 = ListNode(1)
    let n2 = ListNode(2)
    let n3 = ListNode(3)
    let n4 = ListNode(4)
    
    n1.next = n2
    n2.next = n3
    n3.next = n4
    
    return n1
  }
  
  func testSwapPairs() {
    let solution = Solution()
    let result = solution.swapPairs(getTestLinkedList())
    
    var node = result
    var output: [Int] = []
    while node != nil {
      output.append(node!.val)
      node = node?.next
    }
    
    XCTAssertEqual(output, [2, 1, 4, 3])
  }
  
}

TestSwapPairs.defaultTestSuite.run()
