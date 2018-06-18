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
    
    let sLen = s.count
    var sChars = Array(s.lowercased())
    var start = 0
    var end = sLen - 1
    
    while start < end {
      while start < sLen && !isAlphaNumberic(sChars[start]) {
        start += 1
      }
      
      if start == sLen {
        return true    // handle "....,,,"
      }
      
      while end >= 0 && !isAlphaNumberic(sChars[end]) {
        end -= 1
      }
      
      if sChars[start] != sChars[end] {
        return false
      } else {
        start += 1
        end -= 1
      }
      
    }
    
    return end <= start
    
  }
  
  private func isAlphaNumberic(_ c: Character) -> Bool {
    return (c >= "0" && c <= "9") || (c >= "a" && c <= "z")
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
