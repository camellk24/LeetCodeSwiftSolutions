/*:
 # 415. Add Strings
 
 Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
 
 Note:
 
 The length of both num1 and num2 is < 5100.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 
 func addStrings(_ num1: String, _ num2: String) -> String {
 
 }
 
 */


/*:
 
 **Time Complexity:** O(min(n,m))
 
 **Space Complexity:** O(1)
 */

class Solution {
  func addStrings(_ num1: String, _ num2: String) -> String {
    
    var chars1: [Character] = Array(num1)
    var chars2: [Character] = Array(num2)
    
    var i = chars1.count - 1
    var j = chars2.count - 1
    var carry = 0
    var result = ""
    
    while (i >= 0 || j >= 0 || carry > 0) {
      
      var sum = carry

      if i >= 0 {
        sum = sum + getNum(chars1[i])
      }
      
      if j >= 0 {
        sum = sum + getNum(chars2[j])
      }
      
      let newDigit = sum % 10
      
      result = "\(newDigit)\(result)"
      
      // update carry
      carry = sum / 10
      
      i -= 1
      j -= 1
    }
    
    return result
  }
  
  
  private func getNum(_ char: Character) -> Int {
    
    switch char {
    case "1":
      return 1
    case "2":
      return 2
    case "3":
      return 3
    case "4":
      return 4
    case "5":
      return 5
    case "6":
      return 6
    case "7":
      return 7
    case "8":
      return 8
    case "9":
      return 9
    default:
      return 0
    }
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestAddString: XCTestCase {
  
  func testAddString1() {
    let solution = Solution()
    let result = solution.addStrings("123", "456")
    XCTAssertEqual(result, "579")
  }
  
  func testAddString2() {
    let solution = Solution()
    let result = solution.addStrings("12345679012345678", "12345679012345678")
    XCTAssertEqual(result, "24691358024691356")
  }
  
}

TestAddString.defaultTestSuite.run()
