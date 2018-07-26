
/*:
 # 3. Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 **Implement below function**
 
 func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 Sliding Window
 
 NOTE: We cannot use dp to solve this problem, because it's asking for substring, if using dp, following example won't work.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    
    guard s.count > 0 else {
      return 0
    }
    
    let chars = Array(s)
    let n = chars.count
    var used: Set<Character> = []
    var j = 0
    var result = 0
    
    for i in 0 ..< n {
      while j < n && !used.contains(chars[j]) {
        used.insert(chars[j])
        result = max(result, j - i + 1)
        j += 1
      }
      
      // remove char i when move forward
      used.remove(chars[i])
    }
    
    return result
  }
}


/*:
 ## Test
 */
import XCTest

class TestLongestSubstringWithoutRepeatingCharacters: XCTestCase {
  
  func testLongestSubstringWithoutRepeatingCharacters1() {
    let s = "abcabcbb"
    let solution = Solution()
    let result = solution.lengthOfLongestSubstring(s)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestSubstringWithoutRepeatingCharacters2() {
    let s = "bbbbb"
    let solution = Solution()
    let result = solution.lengthOfLongestSubstring(s)
    XCTAssertEqual(result, 1)
  }
  
  func testLongestSubstringWithoutRepeatingCharacters3() {
    let s = "pwwkew"
    let solution = Solution()
    let result = solution.lengthOfLongestSubstring(s)
    XCTAssertEqual(result, 3)
  }
  
  
}

TestLongestSubstringWithoutRepeatingCharacters.defaultTestSuite.run()




