/*:
 # Minimum Subtree
 
 Description
 Given a binary tree, find the subtree with minimum sum. Return the root of the subtree.
 
 Notice
 LintCode will print the subtree which root is your return node.
 It's guaranteed that there is only one subtree with minimum sum and the given binary tree is not an empty tree.
 
 
 Example
 Given a binary tree:
 
       1
    /    \
  -5      2
  / \    / \
 0   2  -4 -5
 return the node 1.
 
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
 Traversal + Divide Conquer
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func findSubTree(_ root: TreeNode?) -> TreeNode? {
    return findMinSubtree(root)?.minSubtree
  }
  
  private func findMinSubtree(_ root: TreeNode?) -> (minSubtree: TreeNode, subtreeSum: Int)? {
    guard let root = root else {
      return nil
    }
    
    let left = findMinSubtree(root.left)
    let right = findMinSubtree(root.right)
    let sum = (left?.subtreeSum ?? 0) + (right?.subtreeSum ?? 0) + root.val
    
    if let left = left, let right = right {
      if left.subtreeSum < right.subtreeSum && left.subtreeSum < sum {
        return left
      } else if right.subtreeSum < left.subtreeSum && right.subtreeSum < sum {
        return right
      } else {
        return (root, sum)
      }
    }
    
    if let left = left, right == nil {
      if left.subtreeSum < sum {
        return left
      } else {
        return (root, sum)
      }
    }
    
    if let right = right, left == nil {
      if right.subtreeSum < sum {
        return right
      } else {
        return (root, sum)
      }
    }
    
    return (root, sum)
    
  }
}



/*:
 ## Test
 */
import XCTest

class TestMinimumSubtree: XCTestCase {
  
  func testMinimumSubtree1() {
    let node1 = TreeNode(1)
    let node_5 = TreeNode(-5)
    let node2 = TreeNode(2)
    let node0 = TreeNode(0)
    let _node2 = TreeNode(2)
    let node_4 = TreeNode(-4)
    let _node_5 = TreeNode(-5)
    
    node1.left = node_5
    node1.right = node2
    node_5.left = node0
    node_5.right = _node2
    node2.left = node_4
    node2.right = _node_5
    
    let result = Solution().findSubTree(node1)
    XCTAssertEqual(result === node1, true)
  }
  
  func testMinimumSubtree2() {
    let node1 = TreeNode(1)
    let node_5 = TreeNode(-5)
    let node2 = TreeNode(2)
    let node0 = TreeNode(0)
    let _node2 = TreeNode(2)
    let node_4 = TreeNode(10)
    let _node_5 = TreeNode(20)
    
    node1.left = node_5
    node1.right = node2
    node_5.left = node0
    node_5.right = _node2
    node2.left = node_4
    node2.right = _node_5
    
    let result = Solution().findSubTree(node1)
    XCTAssertEqual(result === node_5, true)
  }
  
}

TestMinimumSubtree.defaultTestSuite.run()
