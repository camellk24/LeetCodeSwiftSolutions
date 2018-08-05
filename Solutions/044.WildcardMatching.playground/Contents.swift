/*:
 # 44. Wildcard Matching
 
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).
 
 Note:
 
 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like ? or *.
 Example 1:
 
 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:
 
 Input:
 s = "aa"
 p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:
 
 Input:
 s = "cb"
 p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 Example 4:
 
 Input:
 s = "adceb"
 p = "*a*b"
 Output: true
 Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
 Example 5:
 
 Input:
 s = "acdcb"
 p = "a*c?b"
 Output: false
 
 func isMatch(_ s: String, _ p: String) -> Bool {
 
 }
 
 */


/*:
 
 DP - Rolling Array
 
 **Time Complexity:** O(MN)
 
 **Space Complexity:** O(N)
 */

class Solution {
  func isMatch(_ s: String, _ p: String) -> Bool {
    
    if s.isEmpty && p.isEmpty {
      return true
    }
    
    if !s.isEmpty && p.isEmpty {
      return false
    }
      
    var sChars = Array(s)
    var pChars = Array(p)
    
    let m = sChars.count
    let n = pChars.count
    
    // f[i][j] = f[i-1][j-1] where s[i] == s[j] || s[j] == "?"
    // f[i][j] = f[i1][j-1] || f[i-1][j] where s[j] == "*"
    // f[i][j] = false if non of above satisfy
    
    let pArray = Array(repeating: false, count: n + 1)
    var f: [[Bool]] = Array(repeating: pArray, count: 2)
    
    var now = 0
    var old = 0
    
    for i in 0 ... m {
      
      old = now
      now = 1 - old
    
      for j in 0 ... n {
        
        if i == 0 && j == 0 {
            f[now][j] = true
            continue
        }
        
        if j == 0 {
          // empty pattern won't match any non empty string
          f[now][j] = false
          continue
        }
        
        if i > 0 && j > 0 && (sChars[i-1] == pChars[j-1] || pChars[j-1] == "?") {
          f[now][j] = f[old][j-1]
        } else if pChars[j-1] == "*" {
          if i > 0 {
            f[now][j] = f[old][j] || f[now][j-1]
          } else {
            // * does not cover any string
            f[now][j] = f[now][j-1]
          }
        } else {
          f[now][j] = false
        }
      }
    }
    
    return f[now][n]
  }
}

/*:
 
 DP - No Rolling Array
 
 **Time Complexity:** O(MN)
 
 **Space Complexity:** O(MN)
 */

class Solution_No_Rolling_Array {
  func isMatch(_ s: String, _ p: String) -> Bool {
    
    if s.isEmpty && p.isEmpty {
      return true
    }
    
    if !s.isEmpty && p.isEmpty {
      return false
    }
    
    var sChars = Array(s)
    var pChars = Array(p)
    
    let m = sChars.count
    let n = pChars.count
    
    // f[i][j] = f[i-1][j-1] where s[i] == s[j] || s[j] == "?"
    // f[i][j] = f[i1][j-1] || f[i-1][j] where s[j] == "*"
    // f[i][j] = false if non of above satisfy
    
    let pArray = Array(repeating: false, count: n + 1)
    var f: [[Bool]] = Array(repeating: pArray, count: m + 1)
    
    for i in 0 ... m {
      for j in 0 ... n {
        if i == 0 && j == 0 {
          f[i][j] = true
          continue
        }
        
        if j == 0 {
          // empty pattern won't match any non empty string
          f[i][j] = false
          continue
        }
        
        if i > 0 && (sChars[i-1] == pChars[j-1] || pChars[j-1] == "?") {
          f[i][j] = f[i-1][j-1]
        } else if pChars[j-1] == "*" {
          if i > 0 {
            f[i][j] = f[i-1][j] || f[i][j-1]
          } else {
            // * does not cover any string
            f[i][j] = f[i][j-1]
          }
        } else {
          f[i][j] = false
        }
      }
    }
    
    return f[m][n]
  }
}



/*:
 ## Test
 */
import XCTest

class TestWildcardMatching: XCTestCase {
  
  func testWildcardMatching1() {
    let solution = Solution()
    let result = solution.isMatch("aa", "a")
    XCTAssertEqual(result, false)
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.isMatch("aa", "a")
    XCTAssertEqual(result_no_rolling, false)
  }
  
  func testWildcardMatching2() {
    let solution = Solution()
    let result = solution.isMatch("aa", "*")
    XCTAssertEqual(result, true)
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.isMatch("aa", "*")
    XCTAssertEqual(result_no_rolling, true)
  }
  
  func testWildcardMatching3() {
    let solution = Solution()
    let result = solution.isMatch("cb", "?a")
    XCTAssertEqual(result, false)
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.isMatch("cb", "?a")
    XCTAssertEqual(result_no_rolling, false)
  }
  
  func testWildcardMatching4() {
    let solution = Solution()
    let result = solution.isMatch("adceb", "*a*b")
    XCTAssertEqual(result, true)
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.isMatch("adceb", "*a*b")
    XCTAssertEqual(result_no_rolling, true)
  }
  
  func testWildcardMatching5() {
    let solution = Solution()
    let result = solution.isMatch("acdcb", "a*c?b")
    XCTAssertEqual(result, false)
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.isMatch("acdcb", "a*c?b")
    XCTAssertEqual(result_no_rolling, false)
  }
  
}

TestWildcardMatching.defaultTestSuite.run()
