/*:
 # 36. Valid Sudoku
 
 Given values of two nodes in a Binary Tree, find the Lowest Common Ancestor (LCA). It may be assumed that both nodes exist in the tree.
 
 For example, consider the Binary Tree in diagram, LCA of 10 and 14 is 12 and LCA of 8 and 14 is 8.
 
 
     20
    /  \
   8    22
  / \
 4   12
    /  \
  10    14
 
 Let T be a rooted tree. The lowest common ancestor between two nodes n1 and n2 is defined as the lowest node in T that has both n1 and n2 as descendants (where we allow a node to be a descendant of itself).
 
 
 
 func lca(_ n1: TreeNode, _n2: TreeNode) -> TreeNode? {
 
 }
 
 
 */


/*:
 
 Time Complexity: O(m + n)
 
 Space Complexity: O(n)
 
 */

public class TreeNode {
  public var val: Int
  public weak var parent: TreeNode?
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

extension TreeNode: Hashable {
  public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
    return lhs.val == rhs.val && lhs.parent === rhs.parent && lhs.left === rhs.left && lhs.right == rhs.right
  }
  
  
  public var hashValue: Int {
    
    return val.hashValue ^ (parent?.val.hashValue ?? 1) ^ (left?.val.hashValue ?? 1) ^ (right?.val.hashValue ?? 1)
  }
  
}

class Solution {
  func lca(_ n1: TreeNode, _n2: TreeNode) -> TreeNode? {
    var ancestors: Set<TreeNode> = []
    
    var testNode: TreeNode? = n1
    while testNode?.parent != nil {
      ancestors.insert(testNode!.parent!)
      testNode = testNode?.parent
    }
    
    testNode = _n2
    while testNode?.parent != nil {
      let parent: TreeNode = testNode!.parent!
      if ancestors.contains(parent) {
        return parent
      }

      testNode = testNode?.parent
    }
    
    return nil
  }
}

/*:
 ## Test
 */
import XCTest

class TestLCAUsingParent: XCTestCase {
  
  func testLcaUsingParent() {
    let node20 = TreeNode(20)
    let node8 = TreeNode(8)
    let node22 = TreeNode(22)
    let node4 = TreeNode(4)
    let node12 = TreeNode(12)
    let node10 = TreeNode(10)
    let node14 = TreeNode(14)
    
    node20.left = node8
    node20.right = node22
    
    node8.parent = node20
    node22.parent = node20
    
    node8.left = node4
    node8.right = node12
    
    node4.parent = node8
    node12.parent = node8
    
    node12.left = node10
    node12.right = node14
    
    node10.parent = node12
    node14.parent = node12
    
    let solution = Solution()
    
    XCTAssertEqual(solution.lca(node8, _n2: node22) === node20, true)
    XCTAssertEqual(solution.lca(node10, _n2: node14) === node12, true)
    XCTAssertEqual(solution.lca(node14, _n2: node4) === node8, true)
    XCTAssertEqual(solution.lca(node10, _n2: node22) === node20, true)
  }
  
}

TestLCAUsingParent.defaultTestSuite.run()
