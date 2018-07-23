/*:
 # 344. Reverse String
 
 Write a function that takes a string as input and returns the string reversed.
 
 Example:
 Given s = "hello", return "olleh".
 
 func reverseString(_ s: String) -> String {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution {
  func reverseString(_ s: String) -> String {
    
    guard s.count > 0 else {
      return ""
    }
    
    var chars = Array(s)
    
    var i = 0
    var j = chars.count - 1
    
    while i < j {
      let temp = chars[j]
      chars[j] = chars[i]
      chars[i] = temp
      i += 1
      j -= 1
    }
    return String(chars)
  }
}
/*:
 ## Test
 */
import XCTest

class TestReverseString: XCTestCase {
  
  func testReverseString() {
    let s = "hello"
    let solution = Solution()
    let result = solution.reverseString(s)
    XCTAssertEqual(result, "olleh")
  }
  
}

TestReverseString.defaultTestSuite.run()
