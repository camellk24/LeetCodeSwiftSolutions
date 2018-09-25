
/*:
 # 340. Longest Substring with At Most K Distinct Characters
 
 Given a string, find the length of the longest substring T that contains at most k distinct characters.
 
 For example, Given s = “eceba” and k = 2,
 
 T is "ece" which its length is 3.
 

 **Implement below function**
 
 func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
 
 }
 
 */

/*:
 
 Two Pointers - Sliding Windows
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    
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
          if charCountDict.count == k {
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

class TestLongestSubstringWithAtMostKDistinctCharacters: XCTestCase {
  
  func testLongestSubstringWithAtMostKDistinctCharacters1() {
    let s = "eceba"
    let k = 2
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringKDistinct(s, k)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestSubstringWithAtMostKDistinctCharacters2() {
    let s = "eceba"
    let k = 2
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringKDistinct(s, k)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestSubstringWithAtMostKDistinctCharacters3() {
    let s = "aabbcc"
    let k = 1
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringKDistinct(s, k)
    XCTAssertEqual(result, 2)
  }
  
  func testLongestSubstringWithAtMostKDistinctCharacters4() {
    let s = "aabbcc"
    let k = 2
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringKDistinct(s, k)
    XCTAssertEqual(result, 4)
  }
  
  func testLongestSubstringWithAtMostKDistinctCharacters5() {
    let s = "aabbcc"
    let k = 3
    let solution = Solution()
    let result = solution.lengthOfLongestSubstringKDistinct(s, k)
    XCTAssertEqual(result, 6)
  }
  
}

TestLongestSubstringWithAtMostKDistinctCharacters.defaultTestSuite.run()




