/*:
 # Clone Binary Tree
 
 Given a binary tree:
 
     1
    / \
   2   3
  / \
 4   5
 return the new binary tree with same structure and same value:
     1
    / \
   2   3
  / \
 4   5
 
 
 func cloneTree(_ root: TreeNode?) -> TreeNode? {

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
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func cloneTree(_ root: TreeNode?) -> TreeNode? {
    
    guard let root = root else {
      return nil
    }
    
    let newNode = TreeNode(root.val)
    newNode.left = cloneTree(root.left)
    newNode.right = cloneTree(root.right)
    return newNode
  }
}

/*:
 ## Test
 */
import XCTest

class TestCloneBinaryTree: XCTestCase {
  
  func testCloneBinaryTree() {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    
    let solution = Solution()
    let cloneRoot = solution.cloneTree(node1)
    XCTAssertFalse(node1 === cloneRoot)
    XCTAssertFalse(node2 === cloneRoot!.left)
    XCTAssertFalse(node3 === cloneRoot!.right)
    XCTAssertFalse(node4 === cloneRoot!.left!.left)
    XCTAssertFalse(node5 === cloneRoot!.left!.right)
    XCTAssertEqual(cloneRoot?.left!.val, node2.val)
    XCTAssertEqual(cloneRoot?.right!.val, node3.val)
    XCTAssertEqual(cloneRoot?.left!.left!.val, node4.val)
    XCTAssertEqual(cloneRoot?.left!.right!.val, node5.val)
  }
  
}

TestCloneBinaryTree.defaultTestSuite.run()
