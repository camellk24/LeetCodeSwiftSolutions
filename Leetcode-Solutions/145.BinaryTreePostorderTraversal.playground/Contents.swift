/*:
 # 144. Binary Tree Preorder Traversal
 
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [3,2,1]
 
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
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class IterativeSolution {
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else { return [] }
    
    var stack1: [TreeNode] = []
    var stack2: [TreeNode] = []
    var result: [Int] = []
    
    stack1.append(root)
    
    while (!stack1.isEmpty) {
      
      let node = stack1.removeLast()
      
      stack2.append(node)
      
      if let leftNode = node.left {
        stack1.append(leftNode)
      }
      
      if let rightNode = node.right {
        stack1.append(rightNode)
      }
      
    }
    
    while (!stack2.isEmpty) {
      
      let node = stack2.removeLast()
      result.append(node.val)
    }
    
    return result
    
  }
}

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class RecursiveSolution {
  
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    
    var result = [Int]()
    traverse(root, &result)
    return result
  }
  
  
  func traverse(_ root: TreeNode?, _ result: inout [Int]) {
    guard let root = root else {
      return
    }
    traverse(root.left, &result)
    traverse(root.right, &result)
    result.append(root.val)
  }
}

/*:
 ## Test
 */
import XCTest

class TestBinaryTreePostorderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [1,null,2,3]
    let root = TreeNode(1)
    root.left = .none
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(3)
    root.right = nodeTwo
    return root
  }
  
  func testBinaryTreePostorderTraversal() {
    let iterativeSol = IterativeSolution().postorderTraversal(getTestTree())
    let recursiveSol = RecursiveSolution().postorderTraversal(getTestTree())
    XCTAssertEqual(iterativeSol, [3, 2, 1])
    XCTAssertEqual(recursiveSol, [3, 2, 1])
  }
  
}

TestBinaryTreePostorderTraversal.defaultTestSuite.run()


