/*:
 # 242. Valid Anagram
 
 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 Note:
 You may assume the string contains only lowercase alphabets.
 
 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 
 **Implement below function**

 
 func isAnagram(_ s: String, _ t: String) -> Bool {
 
 }
 
 */

/*:
 Traversal
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
      return false
    }
    
    var sDict: [Character : Int] = [:]
    var tDict: [Character : Int] = [:]
    
    let sChars = Array(s)
    let tChars = Array(t)
    let n = sChars.count
    
    for i in 0 ..< n {
      let sChar = sChars[i]
      if sDict[sChar] != nil {
        sDict[sChar] = sDict[sChar]! + 1
      } else {
        sDict[sChar] = 1
      }
      
      let tChar = tChars[i]
      if tDict[tChar] != nil {
        tDict[tChar] = tDict[tChar]! + 1
      } else {
        tDict[tChar] = 1
      }
    }
    
    for (key, value) in sDict {
      if tDict[key] != value {
        return false
      }
    }
    
    return true
  }
}


/*:
 ## Test
 */
import XCTest

class TestValidAnagram: XCTestCase {
  
  func testValidAnagram1() {
    let s = "anagram"
    let t = "nagaram"
    let result = Solution().isAnagram(s, t)
    XCTAssertEqual(result, true)
  }
  
  func testValidAnagram2() {
    let s = "rat"
    let t = "car"
    let result = Solution().isAnagram(s, t)
    XCTAssertEqual(result, false)
  }
  
}

TestValidAnagram.defaultTestSuite.run()
