/*:
 # 110. Balanced Binary Tree
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 
 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example 1:
 
 Given the following tree [3,9,20,null,null,15,7]:
 
   3
  / \
 9  20
    /  \
   15   7
 Return true.
 
 Example 2:
 
 Given the following tree [1,2,2,3,3,null,null,4,4]:
 
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 Return false.
 
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
 
 func isBalanced(_ root: TreeNode?) -> Bool {
 
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
 Divide Conquer
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func isBalanced(_ root: TreeNode?) -> Bool {
    return checkBalanced(root).isBalanced
  }
  
  private func checkBalanced(_ root: TreeNode?) -> (isBalanced: Bool, maxDepth: Int) {
    
    // exit
    guard let root = root else {
      return (true, 0)
    }
    
    // split
    let left = checkBalanced(root.left)
    let right = checkBalanced(root.right)
    
    // subtree not balance
    if !left.isBalanced || !right.isBalanced {
      return (false, -1)
    }
    
    // root not balance
    if (abs(left.maxDepth - right.maxDepth)) > 1 {
      return (false, -1)
    }
    
    let maxDepth = max(left.maxDepth, right.maxDepth) + 1
    return (true, maxDepth)
  }
}


/*:
 ## Test
 */
import XCTest

class TestBalancedBinaryTree: XCTestCase {
  
  func testBalancedBinaryTree1() {
    let node3 = TreeNode(3)
    let node9 = TreeNode(9)
    let node20 = TreeNode(20)
    let node15 = TreeNode(15)
    let node7 = TreeNode(7)
    
    node3.left = node9
    node3.right = node20
    node20.left = node15
    node20.right = node7
    
    let result = Solution().isBalanced(node3)
    XCTAssertEqual(result, true)
  }
  
  func testBalancedBinaryTree2() {
    let node1 = TreeNode(1)
    let node2_1 = TreeNode(2)
    let node2_2 = TreeNode(2)
    let node3_1 = TreeNode(3)
    let node3_2 = TreeNode(3)
    let node4_1 = TreeNode(4)
    let node4_2 = TreeNode(4)
    
    node1.left = node2_1
    node1.right = node2_2
    node2_1.left = node3_1
    node2_1.right = node3_2
    node3_1.left = node4_1
    node3_1.right = node4_2
    
    let result = Solution().isBalanced(node1)
    XCTAssertEqual(result, false)
  }
  
}

TestBalancedBinaryTree.defaultTestSuite.run()
