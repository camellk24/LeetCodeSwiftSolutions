/*:
 # 144. Binary Tree Preorder Traversal
 
 Given a binary tree, return the preorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
  2
 /
 3
 
 Output: [1,2,3]
 
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
 
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
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

class RecursiveSolution {
  
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else {
      return []
    }
    
    var result = [Int]()
    
    traverse(root, &result)
    
    return result
  }
  
  private func traverse(_ root: TreeNode?, _ result: inout [Int]) {
    
    guard let root = root else {
      return
    }
    
    result.append(root.val)
    
    traverse(root.left, &result)
    traverse(root.right, &result)
  }
  
}

class IterativeSolution {
  
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else { return [] }
    
    var stack: [TreeNode] = []
    var result: [Int] = []
    
    stack.append(root)
    
    while !stack.isEmpty {
      
      let node = stack.removeLast()
      result.append(node.val)
      
      if let rightNode = node.right {
        stack.append(rightNode)
      }
      
      if let leftNode = node.left {
        stack.append(leftNode)
      }
      
    }
    
    return result
    
  }
  
}







/*:
 ## Test
 */
import XCTest

class TestBinaryTreePreorderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [1,null,2,3]
    let root = TreeNode(1)
    root.left = .none
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(3)
    root.right = nodeTwo
    return root
  }
  
  func testBinaryTreePreorderTraversal() {
    let recursiveSol = RecursiveSolution().preorderTraversal(getTestTree())
    let iterativeSol = IterativeSolution().preorderTraversal(getTestTree())
    XCTAssertEqual(recursiveSol, [1, 2, 3])
    XCTAssertEqual(iterativeSol, [1, 2, 3])
  }
  
}

TestBinaryTreePreorderTraversal.defaultTestSuite.run()
