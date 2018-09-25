
/*:
 # 113. Path Sum II
 
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:
 
 [
 [5,4,11,2],
 [5,8,4,5]
 ]

 
 **Implement below function**
 
 func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
 
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
  func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var paths: [[Int]] = []
    dfs(root, [], sum, 0, &paths)
    return paths
  }
  
  func dfs(_ root: TreeNode?, _ currPath: [Int], _ target: Int, _ sum: Int, _ paths: inout [[Int]]) {
    guard let root = root else {
      return
    }
    
    var newPath = currPath
    newPath.append(root.val)
    let newSum = sum + root.val
    
    if root.left == nil && root.right == nil {
      if newSum == target {
        paths.append(newPath)
      }
      return
    }
    
    dfs(root.left, newPath, target, newSum, &paths)
    dfs(root.right, newPath, target, newSum, &paths)
  }
}






/*:
 ## Test
 */
import XCTest

class TestPathSumII: XCTestCase {
  
  func testPathSumII() {
    
    let node5 = TreeNode(5)
    let node4 = TreeNode(4)
    let node8 = TreeNode(8)
    let node11 = TreeNode(11)
    let node13 = TreeNode(13)
    let node4_1 = TreeNode(4)
    let node7 = TreeNode(7)
    let node2 = TreeNode(2)
    let node5_1 = TreeNode(5)
    let node1 = TreeNode(1)
    
    node5.left = node4
    node5.right = node8
    node4.left = node11
    node8.left = node13
    node8.right = node4_1
    node11.left = node7
    node11.right = node2
    node4_1.left = node5_1
    node4_1.right = node1
    
    let solution = Solution()
    let result = solution.pathSum(node5, 22)
    XCTAssertEqual(result, [[5, 4, 11, 2], [5, 8, 4, 5]])
  }
  
}

TestPathSumII.defaultTestSuite.run()




