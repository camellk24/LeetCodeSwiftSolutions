/*:
 # 14. Longest Common Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Example 1:
 
 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:
 
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 
 
 */


/*:
 
 Time Complexity:
 
 Space Complexity:
 
 */

class Solution {
  func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else {
      return ""
    }
    
    var prefixChars = Array(strs[0])
    var prefixEndIndex = prefixChars.count
    
    for i in 1 ..< strs.count {
      var j = 0
      let strChars = Array(strs[i])
      
      while j < strChars.count && j < prefixEndIndex && strChars[j] == prefixChars[j] {
        j += 1
      }
      
      if j == 0 {
        return ""
      }
      prefixEndIndex = j
    }
    
    return getSubstring(strs[0], prefixEndIndex) ?? ""
  }
  
  private func getSubstring(_ s: String, _ endIndex: Int) -> String? {
    guard let end = s.index(s.startIndex, offsetBy: endIndex, limitedBy: s.endIndex) else {
      return ""
    }
    return String(s[..<end])
  }
}

/*:
 ## Test
 */
import XCTest

class TestLCP: XCTestCase {
  
  
}

TestLCP.defaultTestSuite.run()
