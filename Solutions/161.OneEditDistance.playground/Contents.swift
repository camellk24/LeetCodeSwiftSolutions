/*:
 # 161. One Edit Distance
 
 Given two strings s and t, determine if they are both one edit distance apart.
 
 Note:
 
 There are 3 possiblities to satisify one edit distance apart:
 
 Insert a character into s to get t
 Delete a character from s to get t
 Replace a character of s to get t
 Example 1:
 
 Input: s = "ab", t = "acb"
 Output: true
 Explanation: We can insert 'c' into s to get t.
 Example 2:
 
 Input: s = "cab", t = "ad"
 Output: false
 Explanation: We cannot get t from s by only one step.
 Example 3:
 
 Input: s = "1203", t = "1213"
 Output: true
 Explanation: We can replace '0' with '1' to get t.
 
 func isOneEditDistance(_ s: String, _ t: String) -> Bool {
 
 }
 
 */


/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    
    var sChars = Array(s)
    var tChars = Array(t)
    
    let m = sChars.count
    let n = tChars.count
    
    // if length diff greater than 1, return false
    if abs(m - n) > 1 {
      return false
    }
    
    var i = 0
    var j = 0
    
    // track number of edits
    var numberOfEdits = 0
    
    while i < m && j < n {
      
      if sChars[i] != tChars[j] {
        // if more than 1 edit needed, return false
        if numberOfEdits == 1 {
          return false
        }
        
        if m > n {
          // means we need to remove a char from s to match t
          // increment i
          i += 1
        } else if m < n {
          // wee need to add a char to s
          // increment j
          j += 1
        } else {
          // we need to edit char
          i += 1
          j += 1
        }
        
        numberOfEdits += 1
        
      } else {
          
        i += 1
        j += 1
      }
    }
    
    if i < m || j < n {
      // last char remains
      numberOfEdits += 1
    }
    
    return numberOfEdits == 1
  }
}


/*:
 ## Test
 */
import XCTest

class TestOneEditDistance: XCTestCase {
  
  func testOneEditDistance1() {
    let solution = Solution()
    let result = solution.isOneEditDistance("ab", "acb")
    XCTAssertEqual(result, true)
  }
  
  func testOneEditDistance2() {
    let solution = Solution()
    let result = solution.isOneEditDistance("cab", "ad")
    XCTAssertEqual(result, false)
  }
  
  func testOneEditDistance3() {
    let solution = Solution()
    let result = solution.isOneEditDistance("1203", "1213")
    XCTAssertEqual(result, true)
  }
  
  func testOneEditDistance4() {
    let solution = Solution()
    let result = solution.isOneEditDistance("1203", "1203")
    XCTAssertEqual(result, false)
  }
  
}

TestOneEditDistance.defaultTestSuite.run()
