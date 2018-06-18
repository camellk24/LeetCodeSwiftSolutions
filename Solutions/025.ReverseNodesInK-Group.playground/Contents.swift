/*:
 # 25. Reverse Nodes in k-Group
 
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 Example:
 
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 
 Note:
 
 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
 
 
 func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
 
 }
 
 */


//  Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
  
  // since we are moving head, we need a dummy node to point to head
  let dummy = ListNode(0)
  dummy.next = head
  
  var currNode: ListNode? = dummy
  while currNode != nil {
    currNode = reverseK(currNode, k)
  }
  return dummy.next
}

// original: head -> n1 -> ... -> nk -> nk+1
// reverse: head -> n1 <- ... <- nk,  nk+1 ->
// reconnect: head -> nk, n1 -> nk+1
// after reconnect: nk+1 <- n1 <- .. <- nk <- head
// return n1
func reverseK(_ head: ListNode?, _ k: Int) -> ListNode? {
  
  
  var nk: ListNode? = head
  
  
  for _ in 0 ..< k {
    if nk == nil {
      // not enough nodes to reverse
      return nil
    }
    nk = nk?.next
  }
  
  
  if nk == nil {
    return nil
  }
  
  // reverse
  let nKPlusOne = nk?.next
  var n1 = head?.next
  
  var prev: ListNode?
  var curr: ListNode? = n1
  
  // swift refrence check
  while (curr !== nKPlusOne) {
    let temp: ListNode? = curr?.next
    curr?.next = prev
    prev = curr
    curr = temp
  }
  
  // connect
  head?.next = nk
  n1?.next = nKPlusOne
  
  return n1
}
/*:
 ## Test
 */
import XCTest

class TestReverseNodesInKGroup: XCTestCase {
  
  func getTestLinkedList() -> ListNode {
    let n1 = ListNode(1)
    let n2 = ListNode(2)
    let n3 = ListNode(3)
    let n4 = ListNode(4)
    let n5 = ListNode(5)
    
    n1.next = n2
    n2.next = n3
    n3.next = n4
    n4.next = n5
    
    return n1
  }
  
  func testReverseNodesInKGroup() {
    let testLinkedList = getTestLinkedList()
    print("test linked list: \(linkedListsToArray(testLinkedList))")
    let result = reverseKGroup(testLinkedList, 2)
    XCTAssertEqual(linkedListsToArray(result), [2, 1, 4, 3, 5])
  }
  
  private func linkedListsToArray(_ head: ListNode?) -> [Int] {
    var result: [Int] = []
    var node: ListNode? = head
    while node != nil {
      result.append(node!.val)
      node = node?.next
    }
    return result
  }
  
}

TestReverseNodesInKGroup.defaultTestSuite.run()
