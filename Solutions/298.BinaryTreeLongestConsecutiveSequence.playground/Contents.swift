
/*:
 # 298. Binary Tree Longest Consecutive Sequence
 
 Given a binary tree, find the length of the longest consecutive sequence path.
 
 The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).
 
 Example 1:
 
 Input:
 
    1
     \
      3
     / \
    2   4
         \
          5
 
 Output: 3
 
 Explanation: Longest consecutive sequence path is 3-4-5, so return 3.
 Example 2:
 
 Input:
 
       2
        \
         3
        /
       2
      /
     1
 
 Output: 2
 
 Explanation: Longest consecutive sequence path is 2-3, not 3-2-1, so return 2.
 
 **Implement below function**
 
 func longestConsecutive(_ root: TreeNode?) -> Int {
 
 }
 
 */

/*:
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

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */
class Solution_I {
  func longestConsecutive(_ root: TreeNode?) -> Int {
    return lc(root, nil, 0)
  }
  
  private func lc(_ root: TreeNode?, _ preValue: Int?, _ preLength: Int) -> Int {
    
    guard let root = root else {
      return 0
    }
    
    var length = 1
    
    if let preValue = preValue, preValue + 1 == root.val {
      length = preLength + 1
    }
    
    let left = lc(root.left, root.val, length)
    let right = lc(root.right, root.val, length)
    
    return max(length, max(left, right))
    
  }
}

/*:
 
 Solution II is better for doing follow up
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */
class Solution_II {
  func longestConsecutive(_ root: TreeNode?) -> Int {
    var maxLength: Int = 0
    _ = traverse(root, &maxLength)
    
    return maxLength
  }
  
  private func traverse(_ root: TreeNode?, _ maxLength: inout Int) -> Int {
    
    guard let root = root else {
      return 0
    }
    
    let leftMax = traverse(root.left, &maxLength)
    let rightMax = traverse(root.right, &maxLength)
    
    var length = 1
    
    if let left = root.left, root.val + 1 == left.val {
      length = max(length, leftMax + 1)
    }
    
    if let right = root.right, root.val + 1 == right.val {
      length = max(length, rightMax + 1)
    }
    
    maxLength = max(length, maxLength)
    
    return length
  }
}




/*:
 ## Test
 */
import XCTest

class TestBinaryTreLongestConsecutiveSequence: XCTestCase {
  
  func testBinaryTreLongestConsecutiveSequence1() {
    
    let node1 = TreeNode(1)
    let node3 = TreeNode(3)
    let node2 = TreeNode(2)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    
    node1.right = node3
    node3.left = node2
    node3.right = node4
    node4.right = node5
    
    let solution1 = Solution_I()
    let solution2 = Solution_II()
    let result1 = solution1.longestConsecutive(node1)
    let result2 = solution2.longestConsecutive(node1)
    XCTAssertEqual(result1, 3)
    XCTAssertEqual(result2, 3)
  }
  
  func testBinaryTreLongestConsecutiveSequence2() {

    let root = TreeNode(2)
    let node3 = TreeNode(3)
    let node2 = TreeNode(2)
    let node1 = TreeNode(1)

    root.right = node3
    node3.left = node2
    node2.left = node1

    let solution1 = Solution_I()
    let solution2 = Solution_II()
    let result1 = solution1.longestConsecutive(root)
    let result2 = solution2.longestConsecutive(root)
    XCTAssertEqual(result1, 2)
    XCTAssertEqual(result2, 2)
  }
  
  
}

TestBinaryTreLongestConsecutiveSequence.defaultTestSuite.run()




