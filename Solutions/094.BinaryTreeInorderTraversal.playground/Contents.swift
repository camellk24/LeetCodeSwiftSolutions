/*:
 # 94. Binary Tree Inorder Traversal
 
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [1,3,2]
 
 **Implement below function**
 
 /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
 
 func inorderTraversal(_ root: TreeNode?) -> [Int] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */


// Definition for a binary tree node.
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



func inorderTraversal(_ root: TreeNode?) -> [Int] {
  
  guard let root = root else { return [] }
  
  var stack: [TreeNode] = []
  var result: [Int] = []
  var testNode: TreeNode? = root
  
  while (testNode != nil || !stack.isEmpty) {
    if let node = testNode {
      stack.append(node)
      testNode = node.left
    } else {
      let node = stack.removeLast()
      result.append(node.val)
      testNode = node.right
    }
  }
  
  return result
  
}


/*:
 ## Test
 */
import XCTest

class TestBinaryTreeInorderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [1,null,2,3]
    let root = TreeNode(1)
    root.left = .none
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(3)
    root.right = nodeTwo
    return root
  }
  
  func testBinaryTreeInorderTraversal() {
    let result = inorderTraversal(getTestTree())
    print("result: \(result)")
    XCTAssertEqual(result, [1, 3, 2])
  }
  
  
}

TestBinaryTreeInorderTraversal.defaultTestSuite.run()
