/*:
 # 449. Serialize and Deserialize BST
 
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
 
 Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary search tree can be serialized to a string and this string can be deserialized to the original tree structure.
 
 The encoded string should be as compact as possible.
 
 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 
 
      5
    /   \
   2     6         <->      "[5,2,1,4,6,8]"
  / \     \
 1   4     8
 
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
      return
    }
    
    appendNode(root, to: &result)
    serialize(root.left, &result)
    serialize(root.right, &result)
  }
  
  private func appendNode(_ node: TreeNode?, to result: inout String) {
    
    guard let node = node else {
      return
    }
    
    if !result.isEmpty {
      result.append(",")
    }
    result.append("\(node.val)")
  }
  
  func deserialize(_ data: String) -> TreeNode? {
    let chars: [Character] = Array(data).filter { $0 != "[" && $0 != "]" && $0 != "," }
    var pos = 0
    return deserialize(chars, &pos, Int.min, Int.max)
  }
  
  func deserialize(_ chars: [Character], _ pos: inout Int, _ min: Int, _ max: Int) -> TreeNode? {
    
    guard chars.count > 0 && pos < chars.count else {
      return nil
    }
    
    if let val = getVal(chars[pos]) {
      if val < min || val > max {
        return nil
      }
      
      let node = TreeNode(val)
      pos = pos + 1
      node.left = deserialize(chars, &pos, min, val)
      node.right = deserialize(chars, &pos, val, max)
      return node
    } else {
      return nil
    }
  }
  
  private func getVal(_ char: Character) -> Int? {
    return Int(String(char))
  }
  
  
  
}





/*:
 ## Test
 */
import XCTest

class TestSerializeAndDeserializeBST: XCTestCase {
  
  func testSerializeBST() {
    
    let node5 = TreeNode(5)
    let node2 = TreeNode(2)
    let node6 = TreeNode(6)
    let node1 = TreeNode(1)
    let node4 = TreeNode(4)
    let node8 = TreeNode(8)
    
    node5.left = node2
    node5.right = node6
    node2.left = node1
    node2.right = node4
    node6.right = node8
    
    let result = Solution().serialize(node5)
    XCTAssertEqual(result, "[5,2,1,4,6,8]")
  }
  
  func testDeserializeBST() {
    let input = "[5,2,1,4,6,8]"
    let node5 = Solution().deserialize(input)
    XCTAssertEqual(node5!.val, 5)
    let node2 = node5!.left
    let node6 = node5!.right
    XCTAssertEqual(node2!.val, 2)
    XCTAssertEqual(node6!.val, 6)
    let node1 = node2!.left
    let node4 = node2!.right
    XCTAssertEqual(node1!.val, 1)
    XCTAssertEqual(node4!.val, 4)
    XCTAssertNil(node6!.left)
    let node8 = node6!.right
    XCTAssertEqual(node8!.val, 8)
  }
  
  
}

TestSerializeAndDeserializeBST.defaultTestSuite.run()
