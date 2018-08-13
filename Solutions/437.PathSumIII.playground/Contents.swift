
/*:
 # 437. Path Sum III
 
 You are given a binary tree in which each node contains an integer value.
 
 Find the number of paths that sum to a given value.
 
 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
 
 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
 
 Example:
 
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
 
       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1
 
 Return 3. The paths that sum to 8 are:
 
 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11
 
 
 **Implement below function**
 
 func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:**
 
 If the tree is balanced, then each node is reached from its ancestors (+ itself) only, which are up to log n. Thus, the time complexity for a balanced tree is O (n * log n).
 However, in the worst-case scenario where the binary tree has the same structure as a linked list, the time complexity is indeed O (n ^ 2)
 
 **Space Complexity:** O(h)
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
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    
    guard let root = root else {
      return 0
    }
    
    return dfs(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
  }
  
  private func dfs(_ root: TreeNode?, _ target: Int) -> Int {
    var result = 0
    
    guard let root = root else {
      return result
    }
    
    if root.val == target {
      result += 1
    }
    
    result += dfs(root.left, target - root.val)
    result += dfs(root.right, target - root.val)
    return result
  }
}


/*:
 ## Test
 */
import XCTest

class TestPathSumIII: XCTestCase {
  
  func testPathSumIII() {
    let node10 = TreeNode(10)
    let node5 = TreeNode(5)
    let node_3 = TreeNode(-3)
    let node3 = TreeNode(3)
    let node2 = TreeNode(2)
    let node11 = TreeNode(11)
    let node3_1 = TreeNode(3)
    let node_2 = TreeNode(-2)
    let node1 = TreeNode(1)
    
    node10.left = node5
    node10.right = node_3
    node5.left = node3
    node5.right = node2
    node_3.right = node11
    node3.left = node3_1
    node3.right = node_2
    node2.right = node1
    
    let result = Solution().pathSum(node10, 8)
    XCTAssertEqual(result, 3)
  }
  
}

TestPathSumIII.defaultTestSuite.run()




