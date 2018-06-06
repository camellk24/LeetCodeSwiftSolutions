/*:
 # 102. Binary Tree Level Order Traversal
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
    3
   / \
   9  20
      / \
     15  7
 return its level order traversal as:
 [
 [3],
 [9,20],
 [15,7]
 ]
 
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
 
 func levelOrder(_ root: TreeNode?) -> [[Int]] {
 
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
  
  guard let root = root else {
    return []
  }
  
  
  var result: [[Int]] = []
  var queue: [TreeNode] = []
  queue.append(root)
  
  while (!queue.isEmpty) {
    var level: [Int] = []
    
    let size = queue.count
    
    for _ in 0 ..< size {
      let node = queue.removeFirst()
      level.append(node.val)
      
      if let leftNode = node.left {
        queue.append(leftNode)
      }
      
      if let rightNnode = node.right {
        queue.append(rightNnode)
      }
    }
    result.append(level)
    
  }
  
  return result
}

/*:
 ## Test
 */
import XCTest

class TestBinaryTreeLevelOrderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    let root = TreeNode(3)
    let nodeTwenty = TreeNode(20)
    nodeTwenty.left = TreeNode(15)
    nodeTwenty.right = TreeNode(7)
    root.left = TreeNode(9)
    root.right = nodeTwenty
    return root
  }
  
  func testBinaryTreeLevelOrderTraversal() {
    let result = levelOrder(getTestTree())
    XCTAssertEqual(result, [[3], [9, 20], [15, 7]])
  }
  
  
}

TestBinaryTreeLevelOrderTraversal.defaultTestSuite.run()
