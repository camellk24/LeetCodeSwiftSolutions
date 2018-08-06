/*:
 # 297. Serialize and Deserialize Binary Tree
 
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
 
 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
 
 Example:
 
 You may serialize the following tree:
 
   1
  / \
  2   3
     / \
    4   5
 
 as "[1,2,3,null,null,4,5]"
 Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
 
 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 
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

class Solution {
  
  func serialize(_ root: TreeNode?) -> String {
    var result = ""
    serialize(root, &result)
    return "[\(result)]"
  }
  
  private func serialize(_ root: TreeNode?, _ result: inout String) {
    guard let root = root else {
      appendNode(nil, to: &result)
      return
    }
    
    appendNode(root, to: &result)
    
    serialize(root.left, &result)
    serialize(root.right, &result)
  }
  
  private func appendNode(_ node: TreeNode?, to result: inout String) {
    
    guard let node = node else {
      if !result.isEmpty {
        result.append(",")
      }
      result.append("#")
      return
    }
    
    if !result.isEmpty {
      result.append(",")
    }
    result.append("\(node.val)")
  }
  
  func deserialize(_ data: String) -> TreeNode? {
    var chars: [Character] = Array(data).filter { $0 != "," && $0 != "[" && $0 != "]"}.reversed()
    return deserialize(&chars)
  }
  
  func deserialize(_ chars: inout [Character]) -> TreeNode? {

    guard chars.count > 0 else {
      return nil
    }
    
    let char = chars.removeLast()
    if let node = getTreeNode(char) {
      node.left = deserialize(&chars)
      node.right = deserialize(&chars)
      return node
    } else {
      return nil
    }
  }
  
  private func getTreeNode(_ char: Character) -> TreeNode? {
    if let val = Int(String(char)) {
      let newNode = TreeNode(val)
      return newNode
    } else {
      return nil
    }
  }
}





/*:
 ## Test
 */
import XCTest

class TestSerializeAndDeserializeBST: XCTestCase {
  
  func testSerializeBST() {
    
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    node3.left = node4
    node3.right = node5
    
    let result = Solution().serialize(node1)
    XCTAssertEqual(result, "[1,2,#,#,3,4,#,#,5,#,#]")
  }
  
  func testDeserializeBST() {
    let input = "[1,2,#,#,3,4,#,#,5,#,#]"
    let node1 = Solution().deserialize(input)
    XCTAssertEqual(node1!.val, 1)
    let node2 = node1!.left
    let node3 = node1!.right
    XCTAssertEqual(node2!.val, 2)
    XCTAssertEqual(node3!.val, 3)
    XCTAssertNil(node2!.left)
    XCTAssertNil(node2!.right)
    let node4 = node3!.left
    let node5 = node3!.right
    XCTAssertEqual(node4!.val, 4)
    XCTAssertEqual(node5!.val, 5)
  }
  
  
}

TestSerializeAndDeserializeBST.defaultTestSuite.run()
