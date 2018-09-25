
/*:
 # Match Parentheses
 
 This function determines if the braces ('(' and ')') in a string are properly matched.
 it ignores non-brace characters.
 Some examples:
 "()()()()"   -> true
 "((45+)*a3)" -> true
 "(((())())"  -> false
 
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */

class Solution {

  func isMatch(_ s: String) -> Bool {
    let chars = Array(s)
    
    guard chars.count > 0 else {
      return true
    }
    
    var count = 0
    
    for char in chars {
      
      if char == "(" {
        count += 1
      } else if char == ")" {
        count -= 1
        if count < 0 {
          return false
        }
      }
    }
    
    return count == 0
  }
  
}



/*:
 ## Test
 */
import XCTest

class TestMatchParentheses: XCTestCase {

  func testMatchParentheses1() {
    let result = Solution().isMatch("()()()()")
    XCTAssertEqual(result, true)
  }
  
  func testMatchParentheses2() {
    let result = Solution().isMatch("((45+)*a3)")
    XCTAssertEqual(result, true)
  }
  
  func testMatchParentheses3() {
    let result = Solution().isMatch("(((())())")
    XCTAssertEqual(result, false)
  }
  
}

TestMatchParentheses.defaultTestSuite.run()




