/*:
 # 91. Decode Ways
 
 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.
 
 Example 1:
 
 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:
 
 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

 
 func numDecodings(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */
class Solution {
  func numDecodings(_ s: String) -> Int {
    
    guard !s.isEmpty else {
      return 0
    }
    
    let chars = Array(s)
    let n = chars.count
    
    // from 0 ~ n
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    
    // initialization
    dp[0] = 1
    
    for i in 1 ... n {
      let char = chars[i-1]
      
      // check single digit
      if charToDigit(char) > 0 {
        dp[i] = dp[i - 1] + dp[i]
      }
      
      // check two digit
      if i >= 2 {
        let number = charToDigit(chars[i-2]) * 10 + charToDigit(char)
        if number >= 10 && number <= 26 {
          dp[i] = dp[i-2] + dp[i]
        }
      }
    }
    
    return dp[n]
  }
  
  private func charToDigit(_ char: Character) -> Int {
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

class TestDecodeWays: XCTestCase {
  
  func testDecodeWays1() {
    let inputs = "12"
    let solution = Solution()
    let result = solution.numDecodings(inputs)
    XCTAssertEqual(result, 2)
  }
  
  func testDecodeWays2() {
    let inputs = "226"
    let solution = Solution()
    let result = solution.numDecodings(inputs)
    XCTAssertEqual(result, 3)
  }
  
}

TestDecodeWays.defaultTestSuite.run()
