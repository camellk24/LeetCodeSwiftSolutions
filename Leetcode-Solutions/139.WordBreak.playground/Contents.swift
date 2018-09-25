/*:
 # 139. Word Break
 
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
 
 Note:
 
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:
 
 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:
 
 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:
 
 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false

 
 
 func wordsAbbreviation(_ dict: [String]) -> [String] {
 
 }
 
 
 */


/*:
 
 DP
 
 Time Complexity: O(n^2)
 
 Space Complexity: O(n)
 
 */

class Solution {
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    
    // dp
    // f[i] = f[i-1] where substring of s contains word in wordDict
    // if include end index i
    
    var wordDictSet = Set<String>()
    var maxWordLength = 0
    
    for i in 0 ..< wordDict.count {
      let word = wordDict[i]
      wordDictSet.insert(word)
      maxWordLength = max(word.count, maxWordLength)
    }
    
    let n = s.count
    
    var f: [Bool] = Array(repeating: false, count: n + 1)
    f[0] = true
    
    
    for i in 1 ... n {
      for j in 0 ..< i {
        
        // if substring length > max word length, continue
        if !f[j] || (i - j) > maxWordLength {
          continue
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: j)
        let endIndex = s.index(s.startIndex, offsetBy: i)
        let substring = String(s[startIndex ..< endIndex])
        if wordDictSet.contains(substring) {
          f[i] = true
        }
      }
    }
    
    return f[n]
  }
}

/*:
 ## Test
 */
import XCTest

class TestWordBreak: XCTestCase {
  
  func testWordBreak1() {
    let solution = Solution()
    let result = solution.wordBreak("leetcode", ["leet", "code"])
    XCTAssertEqual(result, true)
  }
  
  func testWordBreak2() {
    let solution = Solution()
    let result = solution.wordBreak("applepenapple", ["apple", "pen"])
    XCTAssertEqual(result, true)
  }
  
  func testWordBreak3() {
    let solution = Solution()
    let result = solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
    XCTAssertEqual(result, false)
  }
  
}

TestWordBreak.defaultTestSuite.run()
