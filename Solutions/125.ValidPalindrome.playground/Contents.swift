/*:
 # 125. Valid Palindrome
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 
 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:
 
 Input: "race a car"
 Output: false
 
 
 func isPalindrome(_ s: String) -> Bool {
 
 }
 
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else {
      return true
    }
    
    var chars = Array(s.lowercased())
    
    var i = 0
    var j = chars.count - 1
    
    while i < j {
      
      while i < j && !isValidChar(chars[i]) {
        i += 1
      }
      
      while i < j && !isValidChar(chars[j]) {
        j -= 1
      }
      
      if i < j && chars[i] != chars[j] {
        return false
      }
      
      i += 1
      j -= 1
    }
    
    return true
  }
  
  private func isValidChar(_ char: Character) -> Bool {
    return (char >= "0" && char <= "9") || (char >= "a" && char <= "z")
  }
}

/*:
 ## Test
 */
import XCTest

class TestValidPalindrome: XCTestCase {
  
  func testValidPalindrome1() {
    let solution = Solution()
    let result = solution.isPalindrome("A man, a plan, a canal: Panama")
    XCTAssertTrue(result)
  }
  
  func testValidPalindrome2() {
    let solution = Solution()
    let result = solution.isPalindrome("race a car")
    XCTAssertFalse(result)
  }
  
}

TestValidPalindrome.defaultTestSuite.run()
