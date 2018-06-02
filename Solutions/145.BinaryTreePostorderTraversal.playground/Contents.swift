/*:
 # 144. Binary Tree Preorder Traversal
 
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [3,2,1]
 
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
 
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
 
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



func preorderTraversal(_ root: TreeNode?) -> [Int] {
  
  guard let root = root else { return [] }
  
  var stack: [TreeNode] = []
  var result: [Int] = []
  
  stack.append(root)
  
  while !stack.isEmpty {
    
    let node = stack.removeLast()
    result.append(node.val)
    
    if let rightNode = node.right {
      stack.append(rightNode)
    }
    
    if let leftNode = node.left {
      stack.append(leftNode)
    }
    
  }
  
  return result
  
}


/*:
 ## Test
 */
import XCTest

class TestBinaryTreePreorderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [1,null,2,3]
    let root = TreeNode(1)
    root.left = .none
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(3)
    root.right = nodeTwo
    return root
  }
  
  func testBinaryTreePreorderTraversal() {
    let result = preorderTraversal(getTestTree())
    XCTAssertEqual(result, [1, 2, 3])
  }
  
  
}

TestBinaryTreePreorderTraversal.defaultTestSuite.run()
