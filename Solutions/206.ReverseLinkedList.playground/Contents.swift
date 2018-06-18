/*:
 # 206. Reverse Linked List
 

 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 
 func reverseList(_ head: ListNode?) -> ListNode? {
 
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

func reverseList(_ head: ListNode?) -> ListNode? {
  
  guard let head = head else {
    return nil
  }
  
  var prevNode: ListNode? = nil
  var currNode: ListNode? = head
  
  while currNode != nil {
    let tempNode: ListNode? = currNode!.next
    currNode!.next = prevNode
    prevNode = currNode
    currNode = tempNode
  }
  
  return prevNode
}


/*:
 ## Test
 */
import XCTest

class TestReverseLinkedList: XCTestCase {
  
  func testReverseLinkedList() {
    let testLinkedList = getTestLinkedList()
    let result = reverseList(testLinkedList)
    XCTAssertEqual(linkedListsToArray(result), [5, 4, 3, 2, 1])
  }
  
  private func getTestLinkedList() -> ListNode {
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

TestReverseLinkedList.defaultTestSuite.run()
