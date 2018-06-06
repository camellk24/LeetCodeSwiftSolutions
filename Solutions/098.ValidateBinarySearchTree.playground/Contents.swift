/*:
 # 98. Validate Binary Search Tree
 
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 Example 1:
 
 Input:
 2
 / \
 1   3
 Output: true
 Example 2:
 
 5
 / \
 1   4
 / \
 3   6
 Output: false
 Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
 is 5 but its right child's value is 4.
 
 Note:
 
 All of the nodes' values will be unique.
 p and q are different and both values will exist in the binary tree.
 
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
 
 func isValidBST(_ root: TreeNode?) -> Bool {
 
 }
 
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

/*:
 Traversal
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

func isValidBST(_ root: TreeNode?) -> Bool {
  return helper(root, nil, nil)
}

func helper(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
  
  guard let root = root else {
    return true
  }
  
  if let min = min, root.val <= min {
    return false
  }
  
  if let max = max, root.val >= max {
    return false
  }
  
  return helper(root.left, min, root.val) && helper(root.right, root.val, max)
  
  
}


/*:
 ## Test
 */
import XCTest

class TestValidateBinarySearchTree: XCTestCase {
  
  func getTestTree1() -> TreeNode {
    let root = TreeNode(2)
    root.left = TreeNode(1)
    root.right = TreeNode(3)
    return root
  }
  
  func getTestTree2() -> TreeNode {
    let root = TreeNode(5)
    let nodeFour = TreeNode(4)
    nodeFour.left = TreeNode(3)
    nodeFour.right = TreeNode(6)
    
    root.left = TreeNode(1)
    root.right = nodeFour
    return root
  }
  
  func testValidateBinarySearchTree1() {
    let result = isValidBST(getTestTree1())
    XCTAssertTrue(result)
  }
  
  func testValidateBinarySearchTree2() {
    let result = isValidBST(getTestTree2())
    XCTAssertFalse(result)
  }
  
  
}

TestValidateBinarySearchTree.defaultTestSuite.run()
