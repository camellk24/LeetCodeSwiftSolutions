
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
    
    var lrs = ""
    
    guard s.count > 0 else {
      return lrs
    }
    
    let n = s.count
    
    // 1. create suffix array
    var suffix: [String] = Array(repeating: "", count: n)
    for i in 0 ..< s.count {
      let substring = getSubstring(s, from: i)
      suffix[i] = substring
    }
    
    // 2. sort suffix array
    suffix.sort()
    
    // 3. iterate through suffix array and compare each pair to update longest common prefix
    for i in 0 ..< n - 1 {
      let lcp = longestCommonPrefix(suffix[i], suffix[i+1])
      if lcp.count > lrs.count {
        lrs = lcp
      }
    }
    
    return lrs
  }
  
  private func longestCommonPrefix(_ s1: String, _ s2: String) -> String {
    let minString: String = s1.count > s2.count ? s2 : s1
    let minLen = minString.count
    let chars1 = Array(s1)
    let chars2 = Array(s2)
    
    for i in 0 ..< minLen {
      if chars1[i] != chars2[i] {
        // to i, not i + 1, since we don't we to include the one not equal
        return getSubstring(minString, to: i)
      }
    }
    return minString
  }
  
  private func getSubstring(_ s: String, to index: Int) -> String {
    let sIndex = s.index(s.startIndex, offsetBy: index)
    return String(s[..<sIndex])
  }
  
  private func getSubstring(_ s: String, from index: Int) -> String {
    let sIndex = s.index(s.startIndex, offsetBy: index)
    return String(s[sIndex...])
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




