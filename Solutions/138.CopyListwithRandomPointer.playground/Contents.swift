/*:
 # 138. Copy List with Random Pointer
 
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.
 
 Return a deep copy of the list.
 
 */


//  Definition for singly-linked list.
public class RandomListNode {
  public var val: Int
  public var next: RandomListNode?
  public weak var random: RandomListNode?
  public init(_ val: Int, _ next: RandomListNode? = nil, _ random: RandomListNode? = nil) {
    self.val = val
    self.next = next
    self.random = random
  }
}

extension RandomListNode: Equatable {
  public static func ==(lhs: RandomListNode, rhs: RandomListNode) -> Bool {
    return lhs.val == rhs.val && lhs.next === rhs.next && lhs.random === rhs.random
  }
}

extension RandomListNode: Hashable {
  
  public var hashValue: Int {
    return val.hashValue ^ (next?.val.hashValue ?? 1) ^ (random?.val.hashValue ?? 1)
  }
  
}


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

func copyRandomList(_ head: RandomListNode?) -> RandomListNode? {
  
  guard let head = head else {
    return nil
  }
  
  
  var dict: [RandomListNode : RandomListNode] = [:]
  let dummy: RandomListNode = RandomListNode(-1)
  dummy.next = head
  var prev: RandomListNode?
  var curr: RandomListNode? = head
  
  while (curr != nil) {
    var newNode: RandomListNode
    if dict[curr!] != nil {
      newNode = dict[curr!]!
    } else {
      newNode = RandomListNode(curr!.val)
    }
    
    prev?.next = newNode
    
    if let currRandom = curr?.random {
      if let matchNode = dict[currRandom] {
        newNode.random = matchNode
      } else {
        let newRandom = RandomListNode(currRandom.val)
        newNode.random = newRandom
        dict[currRandom] = newRandom
      }
    }
    
    prev = newNode
    curr = curr?.next
  }
  
  return dummy.next
  
}


/*:
 ## Test
 */
import XCTest

class TestCopyRandomList: XCTestCase {
  
  func testCopyRandomList() {
    let node1 = RandomListNode(1)
    let node2 = RandomListNode(2)
    let node3 = RandomListNode(3)
    let node4 = RandomListNode(4)
    
    node1.random = node2
    node2.random = node3
    node3.random = node3
    node4.random = node1
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    
    print("before copy:")
    printList(node1)
    
    print("after copy:")
    printList(copyRandomList(node1))
  }
  
  func printList(_ head: RandomListNode?) {
    var node: RandomListNode? = head
    var res = ""
    while node != nil {
      if res == "" {
        res.append("\(node!.val)(\(node!.random?.val))")
      } else {
        res.append("->\(node!.val)(\(node!.random?.val))")
      }
      
      node = node?.next
    }
    
    print(res)
  }
}

TestCopyRandomList.defaultTestSuite.run()
