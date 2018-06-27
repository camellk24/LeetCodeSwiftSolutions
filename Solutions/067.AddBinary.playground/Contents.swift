/*:
 # 67. Add Binary
 
 Given two binary strings, return their sum (also a binary string).
 
 The input strings are both non-empty and contains only characters 1 or 0.
 
 Example 1:
 
 Input: a = "11", b = "1"
 Output: "100"
 Example 2:
 
 Input: a = "1010", b = "1011"
 Output: "10101"
 
 func addBinary(_ a: String, _ b: String) -> String {
 
 }
 
 */


/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1), return result doesn't count
 */

class Solution {
  
  func addBinary(_ a: String, _ b: String) -> String {
    
    let aChars = Array(a)
    let bChars = Array(b)
    
    var sum = 0
    var i = aChars.count - 1
    var j = bChars.count - 1
    var carry = 0
    var result = ""
    
    while (i >= 0 || j >= 0 || carry > 0) {
      
      sum = carry
      
      if i >= 0 {
        sum += getBinary(from: aChars[i])
        i -= 1
      }
      
      if j >= 0 {
        sum += getBinary(from: bChars[j])
        j -= 1
      }
      
      carry = sum / 2
      sum = sum % 2
      
      result = "\(sum)\(result)"
    }
    
    return result
  }
  
  private func getBinary(from char: Character) -> Int {
    return char == "0" ? 0 : 1
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestAddBinary: XCTestCase {
  
  func testAddBinary1() {
    let solution = Solution()
    let result = solution.addBinary("11", "1")
    XCTAssertEqual(result, "100")
  }
  
  func testAddBinary2() {
    let solution = Solution()
    let result = solution.addBinary("1010", "1011")
    XCTAssertEqual(result, "10101")
  }
  
}

TestAddBinary.defaultTestSuite.run()
