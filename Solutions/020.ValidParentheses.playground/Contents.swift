/*:
 # 20. Valid Parentheses
 
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 
 Example 1:
 
 Input: "()"
 Output: true
 Example 2:
 
 Input: "()[]{}"
 Output: true
 Example 3:
 
 Input: "(]"
 Output: false
 Example 4:
 
 Input: "([)]"
 Output: false
 Example 5:
 
 Input: "{[]}"
 Output: true
 
 
 func isValid(_ s: String) -> Bool {
 
 }
 
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func isValid(_ s: String) -> Bool {
    
    let chars = Array(s)
    var stack: [Character] = []
    
    for char in chars {
      if isOpenP(char) {
        stack.append(char)
      } else if isCloseP(char) {
        if let lastItem = stack.popLast() {
          if char == ")" && lastItem != "(" {
            return false
          } else if char == "]" && lastItem != "[" {
            return false
          } else if char == "}" && lastItem != "{" {
            return false
          }
        } else {
          return false
        }
      }
    }
    
    return stack.isEmpty
    
  }
  
  private func isOpenP(_ char: Character) -> Bool {
    return char == "(" || char == "[" || char == "{"
  }
  
  private func isCloseP(_ char: Character) -> Bool {
    return char == ")" || char == "]" || char == "}"
  }
}

/*:
 ## Test
 */
import XCTest

class TestValidParentheses: XCTestCase {
  
  func testValidParentheses1() {
    let solution = Solution()
    let result = solution.isValid("()")
    XCTAssertEqual(result, true)
  }
  
  func testValidParentheses2() {
    let solution = Solution()
    let result = solution.isValid("()[]{}")
    XCTAssertEqual(result, true)
  }
  
  func testValidParentheses3() {
    let solution = Solution()
    let result = solution.isValid("(]")
    XCTAssertEqual(result, false)
  }
  
  func testValidParentheses4() {
    let solution = Solution()
    let result = solution.isValid("([)]")
    XCTAssertEqual(result, false)
  }
  
  func testValidParentheses5() {
    let solution = Solution()
    let result = solution.isValid("{[]}")
    XCTAssertEqual(result, true)
  }
  
}

TestValidParentheses.defaultTestSuite.run()

