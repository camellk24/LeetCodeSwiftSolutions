
/*:
 # Find the longest substring with k unique characters
 
 References: https://www.geeksforgeeks.org/find-the-longest-substring-with-k-unique-characters-in-a-given-string/
 
 Given a string you need to print longest possible substring that has exactly M unique characters. If there are more than one substring of longest possible length, then print any one of them.
 
 Examples:
 
 "aabbcc", k = 1
 Max substring can be any one from {"aa" , "bb" , "cc"}.
 
 "aabbcc", k = 2
 Max substring can be any one from {"aabb" , "bbcc"}.
 
 "aabbcc", k = 3
 There are substrings with exactly 3 unique characters
 {"aabbcc" , "abbcc" , "aabbc" , "abbc" }
 Max is "aabbcc" with length 6.
 
 "aaabbb", k = 3
 There are only two unique characters, thus show error message.
 
 **Implement below function**
 
 func longestSubstringWithKUniqueCharacters(_ k: Int, _ s: String) -> String {
 
 }
 
 */

/*:
 
 Two Pointers - Sliding Windows
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func longestSubstringWithKUniqueCharacters(_ k: Int, _ s: String) -> String {
    let chars = Array(s)
    let n = chars.count
    var charCountDict: [Character : Int] = [:]
    var result = ""
    var j = 0
    
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
      
      let subString = getSubString(s, i, j)
      
      if subString.count > result.count {
        result = subString
      }
      
      let iChar = chars[i]
      
      if let charCount = charCountDict[iChar] {
        if charCount > 1 {
          charCountDict[iChar] = charCount - 1
        } else {
          charCountDict[iChar] = nil
        }
      }
    }

    return result
  }
  
  private func getSubString(_ s: String, _ lowerBound: Int, _ upperBound: Int) -> String {
    let lowerIndex = s.index(s.startIndex, offsetBy: lowerBound)
    let upperIndex = s.index(s.startIndex, offsetBy: upperBound)
    return String(s[lowerIndex ..< upperIndex])
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestLongestSubstringWithKUniqueCharacters: XCTestCase {
  
  func testLongestSubstringWithKUniqueCharacters1() {
    let s = "aabbcc"
    let k = 1
    let solution = Solution()
    let result = solution.longestSubstringWithKUniqueCharacters(k, s)
    print("result: \(result)")
    let resultSet: Set<String> = ["aa", "bb", "cc"]
    XCTAssertEqual(resultSet.contains(result), true)
  }
  
  func testLongestSubstringWithKUniqueCharacters2() {
    let s = "aabbcc"
    let k = 2
    let solution = Solution()
    let result = solution.longestSubstringWithKUniqueCharacters(k, s)
    print("result: \(result)")
    let resultSet: Set<String> = ["aabb", "bbcc"]
    XCTAssertEqual(resultSet.contains(result), true)
  }
  
  func testLongestSubstringWithKUniqueCharacters3() {
    let s = "aabbcc"
    let k = 3
    let solution = Solution()
    let result = solution.longestSubstringWithKUniqueCharacters(k, s)
    print("result: \(result)")
    let resultSet: Set<String> = ["aabbcc", "aabbc", "abbc"]
    XCTAssertEqual(resultSet.contains(result), true)
  }
}

TestLongestSubstringWithKUniqueCharacters.defaultTestSuite.run()




