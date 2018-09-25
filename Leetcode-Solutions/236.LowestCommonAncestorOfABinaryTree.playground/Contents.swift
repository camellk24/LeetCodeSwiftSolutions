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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
  
  // exit

  guard let root = root else {
    return nil
  }

  if root === p || root === q {
    return root
  }

  // split
  let leftLCA = lowestCommonAncestor(root.left, p, q)
  let rightLCA = lowestCommonAncestor(root.right, p, q)

  if leftLCA != nil && rightLCA != nil {
    return root
  }

  if leftLCA != nil && rightLCA == nil {
    return leftLCA
  }

  if rightLCA != nil && leftLCA == nil {
    return rightLCA
  }

  return nil
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
    
    let result = lowestCommonAncestor(root, nodeFive, nodeOne)
    XCTAssertTrue(result === root)
  }
  
  func testLowestCommonAncestor2() {
    
    // [3,5,1,6,2,0,8,null,null,7,4]
    let root = TreeNode(3)
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(7)
    let nodeFour = TreeNode(4)
    nodeTwo.right = nodeFour
    
    let nodeFive = TreeNode(5)
    nodeFive.left = TreeNode(6)
    nodeFive.right = nodeTwo
    
    let nodeOne = TreeNode(1)
    nodeOne.left = TreeNode(0)
    nodeOne.right = TreeNode(8)
    
    root.left = nodeFive
    root.right = nodeOne
    
    let result = lowestCommonAncestor(root, nodeFive, nodeFour)
    XCTAssertTrue(result === nodeFive)
  }
  
  
}

TestLowestCommonAncestor.defaultTestSuite.run()
