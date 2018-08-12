
/*:
 # 549. Binary Tree Longest Consecutive Sequence II
 
 Given a binary tree, you need to find the length of Longest Consecutive Path in Binary Tree.
 
 Especially, this path can be either increasing or decreasing. For example, [1,2,3,4] and [4,3,2,1] are both considered valid, but the path [1,2,4,3] is not valid. On the other hand, the path can be in the child-Parent-child order, where not necessarily be parent-child order.
 
 Example 1:
 Input:
   1
  / \
 2   3
 Output: 2
 Explanation: The longest consecutive path is [1, 2] or [2, 1].
 Example 2:
 Input:
   2
  / \
 1   3
 Output: 3
 Explanation: The longest consecutive path is [1, 2, 3] or [3, 2, 1].
 Note: All the values of tree nodes are in the range of [-1e7, 1e7].
 
 **Implement below function**
 
 func longestConsecutive(_ root: TreeNode?) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
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

class Solution {
  func longestConsecutive(_ root: TreeNode?) -> Int {
    return traverse(root).maxLen
  }
  
  func traverse(_ root: TreeNode?) -> (maxUp: Int, maxDown: Int, maxLen: Int) {
    
    guard let root = root else {
      return (0, 0, 0)
    }
    
    let leftRes = traverse(root.left)
    let rightRes = traverse(root.right)
    
    var down = 0
    var up = 0
    
    // check left child
    if let left = root.left {
      // down
      if root.val + 1 == left.val {
        down = leftRes.maxDown + 1
      }
      // up
      if root.val - 1 == left.val {
        up = leftRes.maxUp + 1
      }
    }
    
    // check right child
    if let right = root.right {
      // down
      if root.val + 1 == right.val {
        down = max(down, rightRes.maxDown + 1)
      }
      // up
      if root.val - 1 == right.val {
        up = max(up, rightRes.maxUp + 1)
      }
    }
    
    // connect left and right
    var len = up + 1 + down
    len = max(len, max(leftRes.maxLen, rightRes.maxLen))
    return (up, down, len)
  }
}






/*:
 ## Test
 */
import XCTest

class TestBinaryTreeLongestConsecutiveSequenceII: XCTestCase {
  
  func testBinaryTreeLongestConsecutiveSequenceII1() {
    
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    
    node1.left = node2
    node1.right = node3
    
    let solution = Solution()
    let result = solution.longestConsecutive(node1)
    XCTAssertEqual(result, 2)
  }
  
  func testBinaryTreeLongestConsecutiveSequenceII2() {
    
    let node1 = TreeNode(2)
    let node2 = TreeNode(1)
    let node3 = TreeNode(3)
    
    node1.left = node2
    node1.right = node3
    
    let solution = Solution()
    let result = solution.longestConsecutive(node1)
    XCTAssertEqual(result, 3)
  }
  
}

TestBinaryTreeLongestConsecutiveSequenceII.defaultTestSuite.run()




