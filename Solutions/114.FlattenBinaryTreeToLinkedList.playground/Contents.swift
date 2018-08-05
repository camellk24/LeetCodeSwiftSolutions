/*:
 # 114. Flatten Binary Tree to Linked List
 
 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
 
     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:
 
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 
 
 func flatten(_ root: TreeNode?) {
 
 }
 
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

/*:
 Divide and Conquer
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func flatten(_ root: TreeNode?) {
    
    guard let root = root else {
      return
    }
    
    _ = flattenHelper(root)
  }
  
  private func flattenHelper(_ root: TreeNode?) -> TreeNode? {
    
    guard let root = root else {
      return nil
    }
    
    let leftLastNode = flattenHelper(root.left)
    let rightLastNode = flattenHelper(root.right)
    
    // connect left last to root.right
    if leftLastNode != nil {
      leftLastNode!.right = root.right
      root.right = root.left
      root.left = nil
    }
    
    if rightLastNode != nil {
      return rightLastNode
    }
    
    if leftLastNode != nil {
      return leftLastNode
    }
    
    return root
  }
}

/*:
 ## Test
 */
import XCTest

class TestFlattenBinaryTreeToLinkedList: XCTestCase {
  
  func testFlattenBinaryTreeToLinkedList() {
    
    let root = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)
    
    node2.left = node3
    node2.right = node4
    
    node5.right = node6
    
    root.left = node2
    root.right = node5
    
    Solution().flatten(root)
   
    var node: TreeNode? = root
    var result = [Int]()
    while node != nil {
      result.append(node!.val)
      XCTAssertNil(node!.left)
      node = node!.right
    }
    XCTAssertEqual(result, [1,2,3,4,5,6])
  }
  
}

TestFlattenBinaryTreeToLinkedList.defaultTestSuite.run()
