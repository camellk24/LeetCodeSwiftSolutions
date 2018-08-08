/*:
 # 543. Diameter of Binary Tree
 
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
 
 Example:
 Given a binary tree
     1
    / \
   2   3
  / \
 4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
 
 Note: The length of path between two nodes is represented by the number of edges between them.
 
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
 
 func maxDepth(_ root: TreeNode?) -> Int {
 
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
 dfs
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(h)
 */


class Solution {
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var maxDiameter = 0
    traverse(root, 0, &maxDiameter)
    return maxDiameter
  }
  
  func traverse(_ root: TreeNode?, _ currDepth: Int, _ maxDiameter: inout Int) -> Int {
    guard let root = root else {
      return currDepth
    }
    let left = traverse(root.left, currDepth, &maxDiameter)
    let right = traverse(root.right, currDepth, &maxDiameter)
    maxDiameter = max(left + right, maxDiameter)
    return max(left, right) + 1
  }
}

/*:
 ## Test
 */
import XCTest

class TestDiameterOfBinaryTree: XCTestCase {
  
  func testDiameterOfBinaryTree() {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    
    let result = Solution().diameterOfBinaryTree(node1)
    XCTAssertEqual(result, 3)
  }
  
  
}

TestDiameterOfBinaryTree.defaultTestSuite.run()
