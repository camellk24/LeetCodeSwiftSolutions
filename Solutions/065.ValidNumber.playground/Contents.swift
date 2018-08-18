/*:
 # 65. Valid Number
 
 Validate if a given string is numeric.
 
 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 
 Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one.
 
 */


/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func isNumber(_ s: String) -> Bool {
    
    // check empty string
    guard s.count > 0 else {
      return false
    }
    
    let chars = Array(s)
    let n = chars.count
    var i = 0
    var j = n - 1
    
    // trim front white space
    while i <= j && chars[i] == " " {
      i += 1
    }
    
    // all white space, return false
    if i == n {
      return false
    }
    
    // trim back white space
    while i <= j && chars[j] == " " {
      j -= 1
    }
    
    // skip leading +/-
    if chars[i] == "+" || chars[i] == "-" {
      i += 1
    }
    
    var hasNum = false
    var hasDot = false
    var hasExp = false
    
    while i <= j {
      let char = chars[i]
      if isDigit(char) {
        hasNum = true
      } else if char == "." {
        if hasExp || hasDot {
          return false
        }
        hasDot = true
      } else if char == "e" {
        if hasExp || !hasNum {
          return false
        }
        hasExp = true
        hasNum = false // need num after exp
      } else if char == "+" || char == "-" {
        // no need to check i-1, since we check leading +/- at the beginning
        if chars[i-1] != "e" {
          return false
        }
      } else {
        // anything else, " ", any letters will be result a false
        return false
      }
      i += 1
    }
    
    return hasNum
  }
  
  private func isDigit(_ char: Character) -> Bool {
    return char >= "0" && char <= "9"
  }
}
/*:
 ## Test
 */
import XCTest

class TestValidNumber: XCTestCase {
  
  func testValidNumber() {
    let solution = Solution()
    XCTAssertEqual(solution.isNumber("0"), true)
    XCTAssertEqual(solution.isNumber(" 0.1"), true)
    XCTAssertEqual(solution.isNumber("abc"), false)
    XCTAssertEqual(solution.isNumber("1 a"), false)
    XCTAssertEqual(solution.isNumber("2e10"), true)
    XCTAssertEqual(solution.isNumber("-e10"), false)
    XCTAssertEqual(solution.isNumber(" 2e-9"), true)
    XCTAssertEqual(solution.isNumber("+e1"), false)
    XCTAssertEqual(solution.isNumber("1+e"), false)
    XCTAssertEqual(solution.isNumber(" "), false)
    XCTAssertEqual(solution.isNumber("e9"), false)
    XCTAssertEqual(solution.isNumber("4e+"), false)
    XCTAssertEqual(solution.isNumber(" -."), false)
    XCTAssertEqual(solution.isNumber("+.8"), true)
    XCTAssertEqual(solution.isNumber(" 005047e+6"), true)
    XCTAssertEqual(solution.isNumber(".e1"), false)
    XCTAssertEqual(solution.isNumber("3.e"), false)
    XCTAssertEqual(solution.isNumber("3.e1"), true)
    XCTAssertEqual(solution.isNumber("+1.e+5"), true)
    XCTAssertEqual(solution.isNumber(" -54.53061"), true)
    XCTAssertEqual(solution.isNumber(". 1"), false)
  }
  
}

TestValidNumber.defaultTestSuite.run()
