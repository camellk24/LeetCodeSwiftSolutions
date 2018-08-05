/*:
 # 107. Binary Tree Level Order Traversal II
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
  /     \
 15      7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
 ]
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
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
  func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    
    guard let root = root else {
      return []
    }
    
    var queue: [TreeNode] = [root]
    var result: [[Int]] = []
    
    while !queue.isEmpty {
      
      let size = queue.count
      var level: [Int] = []
      
      for i in 0 ..< size {
        let node = queue.removeFirst()
        level.append(node.val)
        
        if let left = node.left {
          queue.append(left)
        }
        
        if let right = node.right {
          queue.append(right)
        }
      }
      
      result.append(level)
    }
    
    
    return result.reversed()
  }
}





/*:
 ## Test
 */
import XCTest

class TestBinaryTreeLevelOrderTraversalII: XCTestCase {
  
  func testLinkedListCycle1() {
    
    let node3 = TreeNode(3)
    let node9 = TreeNode(9)
    let node20 = TreeNode(20)
    let node15 = TreeNode(15)
    let node7 = TreeNode(7)
    
    node3.left = node9
    node3.right = node20
    node20.left = node15
    node20.right = node7
    
    let result = Solution().levelOrderBottom(node3)
    
    XCTAssertEqual(result, [[15,7], [9,20], [3]])
    
  }
  
  
}

TestBinaryTreeLevelOrderTraversalII.defaultTestSuite.run()
