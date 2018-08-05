/*:
 # 43. Multiply Strings
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
 
 Example 1:
 
 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:
 
 Input: num1 = "123", num2 = "456"
 Output: "56088"
 Note:
 
 The length of both num1 and num2 is < 110.
 Both num1 and num2 contain only digits 0-9.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 
 func multiply(_ num1: String, _ num2: String) -> String {
 
 }
 
 */


/*:
 
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
  func multiply(_ num1: String, _ num2: String) -> String {
    
  }
}
/*:
 ## Test
 */
import XCTest

class TestMultiplyStrings: XCTestCase {
  
  func testMultiplyStrings1() {
    let solution = Solution()
    let result = solution.multiply("2", "3")
    XCTAssertEqual(result, "6")
  }
  
  func testMultiplyStrings2() {
    let solution = Solution()
    let result = solution.multiply("123", "456")
    XCTAssertEqual(result, "56088")
  }
  
}

TestMultiplyStrings.defaultTestSuite.run()
