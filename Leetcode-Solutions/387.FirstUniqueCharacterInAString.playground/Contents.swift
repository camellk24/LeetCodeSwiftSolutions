/*:
 # 387. First Unique Character in a String
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 
 **Implement below function**
 
 
 func firstUniqChar(_ s: String) -> Int {
 
 }
 
 */

/*:
 Traversal
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func firstUniqChar(_ s: String) -> Int {
    var dict: [Character : Int] = [:]
    
    let chars = Array(s)
    let n = chars.count
    
    for i in 0 ..< n {
      let char = chars[i]
      if dict[char] != nil {
        dict[char] = -1
      } else {
        dict[char] = i
      }
    }
    
    var minIndex = Int.max
    for (_, value) in dict {
      if value != -1 {
        minIndex = min(value, minIndex)
      }
    }
    
    if minIndex != Int.max {
      return minIndex
    } else {
      return -1
    }
  }
}


/*:
 ## Test
 */
import XCTest

class TestFirstUniqueCharacterInAString: XCTestCase {
  
  func testFirstUniqueCharacterInAString1() {
    let s = "leetcode"
    let result = Solution().firstUniqChar(s)
    XCTAssertEqual(result, 0)
  }
  
  func testFirstUniqueCharacterInAString2() {
    let s = "loveleetcode"
    let result = Solution().firstUniqChar(s)
    XCTAssertEqual(result, 2)
  }
  
}

TestFirstUniqueCharacterInAString.defaultTestSuite.run()
