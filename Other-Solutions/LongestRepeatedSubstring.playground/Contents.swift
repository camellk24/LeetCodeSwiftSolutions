
/*:
 # Longest Repeated Substring
 
 Given a text string, find Longest Repeated Substring in the text. If there are more than one Longest Repeated Substrings, get any one of them.
 
 Longest Repeated Substring in GEEKSFORGEEKS is: GEEKS
 Longest Repeated Substring in AAAAAAAAAA is: AAAAAAAAA
 Longest Repeated Substring in ABCDEFG is: No repeated substring
 Longest Repeated Substring in ABABABA is: ABABA
 Longest Repeated Substring in ATCGATCGA is: ATCGA
 Longest Repeated Substring in banana is: ana
 Longest Repeated Substring in abcpqrabpqpq is: ab (pq is another LRS here)
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func longestRepeatedSubstring(_ s: String) -> String {
    
    /*
     
     banana
     anana
     nana
     ana
     na
     a
     
     sorted
     
     a
     ana
     anana
     banana
     na
     nana
     
     */
    
    var result = ""
    
    // build and sort
    var suffixes: [String] = buildSuffixes(s)
    
    
    // compare longest common prefixes
    
    for i in 0 ..< suffixes.count - 1 {
      let _lcp = lcp(suffixes[i], suffixes[i+1])
      if _lcp.count > result.count {
        result = _lcp
      }
    }
    
    return result
  }
  
  private func lcp(_ s1: String, _ s2: String) -> String {
    let chars1 = Array(s1)
    let chars2 = Array(s2)
    
    let minLen = min(chars1.count, chars2.count)
    
    var result = ""
    for i in 0 ..< minLen {
      if chars1[i] != chars2[i] {
        return result
      }
      result = "\(result)\(chars1[i])"
    }
    return result
  }
  
  private func buildSuffixes(_ s: String) -> [String] {
    var suffixes: [String] = []
    for i in 0 ..< s.count {
      let subString = getSubString(s, from: i)
      suffixes.append(subString)
    }
    return suffixes.sorted(by: <)
  }
  
  private func getSubString(_ s: String, from index: Int) -> String {
    let index = s.index(s.startIndex, offsetBy: index)
    return String(s[index...])
  }
  
}





/*:
 ## Test
 */
import XCTest

class TestLongestRepeatedSubstring: XCTestCase {
  
  func testLongestRepeatedSubstring1() {
    let input = "GEEKSFORGEEKS"
    let output = "GEEKS"
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }

  func testLongestRepeatedSubstring2() {
    let input = "AAAAAAAAAA"
    let output = "AAAAAAAAA"
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  func testLongestRepeatedSubstring3() {
    let input = "ABCDEFG"
    let output = ""
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  func testLongestRepeatedSubstring4() {
    let input = "ABABABA"
    let output = "ABABA"
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  func testLongestRepeatedSubstring5() {
    let input = "ATCGATCGA"
    let output = "ATCGA"
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  func testLongestRepeatedSubstring6() {
    let input = "banana"
    let output = "ana"
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  func testLongestRepeatedSubstring7() {
    let input = "abcpqrabpqpq"
    let output = "ab" // or pq
    let result = Solution().longestRepeatedSubstring(input)
    XCTAssertEqual(result, output)
  }
  
  
}

TestLongestRepeatedSubstring.defaultTestSuite.run()




