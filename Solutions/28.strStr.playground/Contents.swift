/*:
 
 # Implement strStr().
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 **Example 1:**
 
 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 **Example 2:**
 
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 
 **Implement**
 
 func strStr(_ haystack: String, _ needle: String) -> Int {
 
 }
 
 */

/*:
 ## Solution
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
  
  let hChars = Array(haystack), nChars = Array(needle)
  let hLen = hChars.count, nLen = nChars.count
  
  guard hLen >= nLen else {
    return -1
  }
  guard nLen != 0 else {
    return 0
  }
  
  for i in 0...hLen - nLen {
    if hChars[i] == nChars[0] {
      for j in 0..<nLen {
        if hChars[i + j] != nChars[j] {
          break
        }
        if j + 1 == nLen {
          return i
        }
      }
    }
  }
  
  return -1
}


/*:
 Test strStr
 */

import XCTest

class TestStrStr: XCTestCase {
  
  func testIndexFound() {
    
    let haystack = "missisipi"
    let needle = "sisip"
    
    let index = strStr(haystack, needle)
    
    XCTAssertEqual(index, 3)
    
  }
  
  func testNoIndexFound() {
    
    let haystack = "missisipi"
    let needle = "sissi"
    
    let index = strStr(haystack, needle)
    
    XCTAssertEqual(index, -1)
    
  }
  
  func testNeedleLengthGreaterThanHaystack() {
    
    let needle = "missisipi"
    let haystack = "issi"
    
    let index = strStr(haystack, needle)
    
    XCTAssertEqual(index, -1)
    
  }
  
  func testTwoEmptyString() {

    let needle = ""
    let haystack = ""
    
    let index = strStr(haystack, needle)
    
    XCTAssertEqual(index, 0)
    
  }
  
}

TestStrStr.defaultTestSuite.run()
