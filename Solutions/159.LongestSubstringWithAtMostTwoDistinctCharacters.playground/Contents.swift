
/*:
 # 159. Longest Substring with At Most Two Distinct Characters
 
 Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.
 
 Example 1:
 
 Input: "eceba"
 Output: 3
 Explanation: t is "ece" which its length is 3.
 Example 2:
 
 Input: "ccaabbb"
 Output: 5
 Explanation: t is "aabbb" which its length is 5.
 
 **Implement below function**
 
 func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 Two Pointers - Sliding Windows
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
    
    let chars = Array(s)
    let n = chars.count
    var charCountDict: [Character : Int] = [:]
    var j = 0
    var maxLen = 0
    
    for i in 0 ..< n {
      while j < n {
        let jChar = chars[j]
        if let charCount = charCountDict[jChar] {
          charCountDict[jChar] = charCount + 1
        } else {
          if charCountDict.count == 2 {
            break
          } else {
            charCountDict[jChar] = 1
          }
        }
        j += 1
      }
      
      // here we don't need to + 1 because when j jump out of loop, j is one index forward
      maxLen = max(maxLen, j - i)
      let iChar = chars[i]
      if let charCount = charCountDict[iChar] {
        if charCount > 1 {
          charCountDict[iChar] = charCount - 1
        } else {
          charCountDict[iChar] = nil
        }
      }
    }
    
    return maxLen
    
  }
}


/*:
 ## Test
 */
import XCTest

class TestLongestSubstringWithAtMostTwoDistinctCharacters: XCTestCase {
  
  func testLongestSubstringWithAtMostTwoDistinctCharacters1() {
    let s = "eceba"
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringTwoDistinct(s)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestSubstringWithAtMostTwoDistinctCharacters2() {
    let s = "ccaabbb"
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringTwoDistinct(s)
    XCTAssertEqual(result, 5)
  }
}

TestLongestSubstringWithAtMostTwoDistinctCharacters.defaultTestSuite.run()




