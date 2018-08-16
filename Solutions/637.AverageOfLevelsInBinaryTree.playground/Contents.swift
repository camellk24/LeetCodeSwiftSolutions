/*:
 # 637. Average of Levels in Binary Tree
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:
 Input:
   3
  / \
 9  20
   /  \
  15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:
 The range of node's value is in the range of 32-bit signed integer.
 
 **Implement below function**
 
 
 func averageOfLevels(_ root: TreeNode?) -> [Double] {
 
 }
 
 */

/*:
 Traversal
 
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
  func averageOfLevels(_ root: TreeNode?) -> [Double] {
    
    guard let root = root else {
      return []
    }
    
    var results: [Double] = []
    var queue: [TreeNode] = [root]
    
    while (!queue.isEmpty) {
      
      let size = queue.count
      var sum = 0
      
      for _ in 0 ..< size {
        let node = queue.removeFirst()
        sum += node.val
        
        if let left = node.left {
          queue.append(left)
        }
        
        if let right = node.right {
          queue.append(right)
        }
      }
      
      let avg = Double(sum) / Double(size)
      results.append(avg)
      
    }
    
    return results
    
  }
}


/*:
 ## Test
 */
import XCTest

class TestAverageOfLevelsInBinaryTree: XCTestCase {
  
  func testAverageOfLevelsInBinaryTree() {
    let node3 = TreeNode(3)
    let node9 = TreeNode(9)
    let node20 = TreeNode(20)
    let node15 = TreeNode(15)
    let node7 = TreeNode(7)
    
    node3.left = node9
    node3.right = node20
    node20.left = node15
    node20.right = node7
    
    let result = Solution().averageOfLevels(node3)
    XCTAssertEqual(result, [3, 14.5, 11])
  }
  
}

TestAverageOfLevelsInBinaryTree.defaultTestSuite.run()
