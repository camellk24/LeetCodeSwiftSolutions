/*:
 # 236. Lowest Common Ancestor of a Binary Tree
 
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”
 
 Given the following binary search tree:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
          ______3______
         /             \
     ___5___         ___1__
    /       \       /      \
   6         2      0       8
            / \
           7   4
 
 Example 1:
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of of nodes 5 and 1 is 3.
 Example 2:
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself
 according to the LCA definition.
 
 Note:
 
 All of the nodes' values will be unique.
 p and q are different and both values will exist in the binary tree.
 
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
 
 func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
 
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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
  
  // exit
  
  guard let root = root else {
    return .none
  }
  
  if root.val == p.val || root.val == q.val {
    return root
  }
  
  // split
  let leftLCA = lowestCommonAncestor(root.left, p, q: q)
  let rightLCA = lowestCommonAncestor(root.right, p, q: q)
  
  if leftLCA != nil && rightLCA != nil {
    return root
  }
  
  if leftLCA != nil && rightLCA == nil {
    return leftLCA
  }
  
  if rightLCA != nil && leftLCA == nil {
    return rightLCA
  }
  
  return .none
}


/*:
 ## Test
 */
import XCTest

class TestLowestCommonAncestor: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [3,5,1,6,2,0,8,null,null,7,4]
    let root = TreeNode(3)
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(7)
    nodeTwo.right = TreeNode(4)
    
    let nodeFive = TreeNode(5)
    nodeFive.left = TreeNode(6)
    nodeFive.right = nodeTwo
    
    let nodeOne = TreeNode(1)
    nodeOne.left = TreeNode(0)
    nodeOne.right = TreeNode(8)
    
    root.left = nodeFive
    root.right = nodeOne
    return root
  }
  
  func testLowestCommonAncestor1() {
    let result = lowestCommonAncestor(getTestTree(), TreeNode(5), q: TreeNode(1))
    XCTAssertEqual(result?.val, 3)
  }
  
  func testLowestCommonAncestor2() {
    let result = lowestCommonAncestor(getTestTree(), TreeNode(5), q: TreeNode(4))
    XCTAssertEqual(result?.val, 5)
  }
  
  
}

TestLowestCommonAncestor.defaultTestSuite.run()
