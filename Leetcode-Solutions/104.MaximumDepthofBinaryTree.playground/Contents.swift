/*:
 # 104. Maximum Depth of Binary Tree
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9   20
      /  \
     15   7
 
 return its depth = 3.
 
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
 Use Divide and Conquer
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

func maxDepth_divide_conquer(_ root: TreeNode?) -> Int {
  
  guard let root = root else {
    return 0
  }
  
  let leftDepth = maxDepth_divide_conquer(root.left)
  let rightDepth = maxDepth_divide_conquer(root.right)
  
  return max(leftDepth, rightDepth) + 1
}

/*:
 DFS
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

func maxDepth_dfs(_ root: TreeNode?) -> Int {
  
  guard let root = root else {
    return 0
  }
  
  return dfs(root, 0)
}

func dfs(_ root: TreeNode?, _ maxDepth: Int) -> Int {
  guard let root = root else {
    return maxDepth
  }
  return max(dfs(root.left, maxDepth + 1), dfs(root.right, maxDepth + 1))
}




/*:
 ## Test
 */
import XCTest

class TestMaximumDepthOfBinaryTree: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [3,9,20,null,null,15,7]
    let root = TreeNode(3)
    root.left = TreeNode(9)
    let nodeTwenty = TreeNode(20)
    nodeTwenty.left = TreeNode(15)
    nodeTwenty.right = TreeNode(7)
    root.right = nodeTwenty
    return root
  }
  
  func testMaxDepth_DivideConquer() {
    let result = maxDepth_divide_conquer(getTestTree())
    XCTAssertEqual(result, 3)
  }
  
  func testMaxDepth_dfs() {
    let result = maxDepth_dfs(getTestTree())
    XCTAssertEqual(result, 3)
  }
  
  
}

TestMaximumDepthOfBinaryTree.defaultTestSuite.run()
