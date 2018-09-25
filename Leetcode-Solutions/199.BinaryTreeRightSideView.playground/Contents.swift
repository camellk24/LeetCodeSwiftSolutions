/*:
 # 199. Binary Tree Right Side View
 
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 Example:
 
 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:
 
     1            <---
   /   \
  2     3         <---
   \     \
    5     4       <---
 
 **Implement below function**
 
 func rightSideView(_ root: TreeNode?) -> [Int] {
 
 }
 
 */

/*:
 BFS
 
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
  func rightSideView(_ root: TreeNode?) -> [Int] {
    // find the right most node in each level
    
    guard let root = root else {
      return []
    }
    
    var result: [Int] = []
    
    // use bfs to traverse the tree
    var queue: [TreeNode] = []
    queue.append(root)
    
    while !queue.isEmpty {
      
      // remember nodes in current level
      let size = queue.count
      
      for i in 0 ..< size {
        
        let node = queue.removeFirst()
        
        if i + 1 == size {
          result.append(node.val)
        }
        
        if let left = node.left {
          queue.append(left)
        }
        
        if let right = node.right {
          queue.append(right)
        }
        
      }
      
    }
    
    return result
  }
}


/*:
 ## Test
 */
import XCTest

class TestBinaryTreeRightSideView: XCTestCase {
  
  func testBinaryTreeRightSideView() {
    let root = TreeNode(1)
    let nodeTwo = TreeNode(2)
    let nodeThree = TreeNode(3)
    let nodeFour = TreeNode(4)
    let nodeFive = TreeNode(5)
    
    root.left = nodeTwo
    root.right = nodeThree
    nodeTwo.right = nodeFive
    nodeThree.right = nodeFour
    
    let solution = Solution()
    let result = solution.rightSideView(root)
    XCTAssertEqual(result, [1, 3, 4])
  }
  
}

TestBinaryTreeRightSideView.defaultTestSuite.run()
