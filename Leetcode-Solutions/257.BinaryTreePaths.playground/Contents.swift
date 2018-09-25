/*:
 # 257. Binary Tree Paths
 
 Given a binary tree, return all root-to-leaf paths.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Input:
 
 1
 /   \
 2     3
 \
 5
 
 Output: ["1->2->5", "1->3"]
 
 Explanation: All root-to-leaf paths are: 1->2->5, 1->3
 
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
 Traversal
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

func binaryTreePaths(_ root: TreeNode?) -> [String] {
  
  var paths: [String] = []
  
  guard let root = root else {
    return paths
  }
  
  if root.left == nil && root.right == nil {
    paths.append("\(root.val)")
    return paths
  }
  
  let leftBinaryTreePaths = binaryTreePaths(root.left)
  let rightBinaryTreePaths = binaryTreePaths(root.right)
  
  for path in leftBinaryTreePaths {
    paths.append("\(root.val)->\(path)")
  }
  
  for path in rightBinaryTreePaths {
    paths.append("\(root.val)->\(path)")
  }
  
  return paths
  
}


/*:
 ## Test
 */
import XCTest

class TestBinaryTreePaths: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [3,9,20,null,null,15,7]
    let root = TreeNode(1)
    let nodeTwo = TreeNode(2)
    nodeTwo.right = TreeNode(5)
    root.left = nodeTwo
    root.right = TreeNode(3)
    return root
  }
  
  func testBinaryTreePaths() {
    let result = binaryTreePaths(getTestTree())
    XCTAssertEqual(result, ["1->2->5", "1->3"])
  }
  
  
}

TestBinaryTreePaths.defaultTestSuite.run()
