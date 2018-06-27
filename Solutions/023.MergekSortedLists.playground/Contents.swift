/*:
 # 23. Merge k Sorted Lists
 
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Example:
 
 Input:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 
 
 **Implement below function**
 
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
 
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
  func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    
    guard !lists.isEmpty else {
      return nil
    }
    
    return mergeHelper(lists, 0, lists.count - 1)
    
  }
  
  private func mergeHelper(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
    
    if start == end {
      return lists[start]
    }
    
    let mid = start + (end - start) / 2
    
    let left = mergeHelper(lists, start, mid)
    let right = mergeHelper(lists, mid + 1, end)
    
    
    return merge(left, right)
  }
  
  private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let dummy = ListNode(0)
    var lastNode: ListNode? = dummy
    var l1: ListNode? = l1
    var l2: ListNode? = l2
    
    while l1 != nil && l2 != nil {
      
      if l1!.val < l2!.val {
        lastNode?.next = l1
        l1 = l1!.next
      } else {
        lastNode?.next = l2
        l2 = l2!.next
      }
      lastNode = lastNode?.next
    }
    
    if l1 != nil {
      lastNode?.next = l1
    } else {
      lastNode?.next = l2
    }
    
    return dummy.next
  }
  
  func listNodeToArray(_ listNode: ListNode?) -> [Int] {
    var node: ListNode? = listNode
    var resultArray: [Int] = []
    while node != nil {
      resultArray.append(node!.val)
      node = node?.next
    }
    
    return resultArray
  }
}


/*:
 ## Test
 */
import XCTest

class TestMergeKSortedLists: XCTestCase {
  
  func testMergeKSortedLists() {
    // linked list 1
    let node1 = ListNode(1)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    
    node1.next = node4
    node4.next = node5
    
    // linked list 2
    let nodeOne = ListNode(1)
    let nodeThree = ListNode(3)
    let nodeFour = ListNode(4)
    
    nodeOne.next = nodeThree
    nodeThree.next = nodeFour
    
    // linked list 3
    let listNode2 = ListNode(2)
    let listNode6 = ListNode(6)
    
    listNode2.next = listNode6
    
    let solution = Solution()
    let result = solution.mergeKLists([node1, nodeOne, listNode2])
    XCTAssertEqual(solution.listNodeToArray(result), [1, 1, 2, 3, 4, 4, 5, 6])
    
  }
  
}

TestMergeKSortedLists.defaultTestSuite.run()
