
/*:
 # Longest Possible Chunked Palindrome
 
 Given a string, the task is to return the length of its longest possible chunked palindrome. It means a palindrome formed by substring in the case when it is not formed by characters of the string. For better understanding look at the example
 
 Examples:
 
 Input : ghiabcdefhelloadamhelloabcdefghi
 Output : 7
 (ghi)(abcdef)(hello)(adam)(hello)(abcdef)(ghi)
 
 Input : merchant
 Output : 1
 (merchant)
 
 Input : antaprezatepzapreanta
 Output : 11
 (a)(nt)(a)(pre)(za)(tpe)(za)(pre)(a)(nt)(a)
 
 Input : geeksforgeeks
 Output : 3
 (geeks)(for)(geeks)
 
 **Implement below function**
 
 func countChunk(_ s: String) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 */

class Solution {
  
  func countChunk(_ s: String) -> Int {
  
    guard s.count > 0 else {
      return 0
    }
    
    var count = 0
    var fastL = 0
    var fastR = s.count - 1
    var slowL = 0
    var slowR = fastR
    
    while fastL < fastR {
      let chunkL = substring(s, slowL, fastL + 1)
      let chunkR = substring(s, fastR, slowR + 1)
      
      fastL += 1
      fastR -= 1
      
      if chunkL == chunkR {
        count += 2
        slowL = fastL
        slowR = fastR
      }
    }
    
    // check remaining string
    
    if fastL == fastR {
      // odd number of string, one last string uncheck
      count += 1
    } else if slowL < slowR {
      // no equal string found, chunk will be it's own
      count += 1
    }

    return count
  }
  
  private func substring(_ s: String, _ lowerBound: Int, _ upperBound: Int) -> String {
    let lowerBoundIndex = s.index(s.startIndex, offsetBy: lowerBound)
    let upperBoundIndex = s.index(s.startIndex, offsetBy: upperBound)
    return String(s[lowerBoundIndex ..< upperBoundIndex])
  }
}

/*:
 ## Test
 */
import XCTest

class TestLongestPossibleChunkedPalindrome: XCTestCase {
  
  func testLongestPossibleChunkedPalindrome() {
    let s = "volvo"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestPossibleChunkedPalindrome1() {
    let s = "volvov"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 5)
  }
  
  func testLongestPossibleChunkedPalindrome2() {
    let s = "volvol"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 2)
  }

  func testLongestPossibleChunkedPalindrome3() {
    let s = "ghiabcdefhelloadamhelloabcdefghi"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 7)
  }

  func testLongestPossibleChunkedPalindrome4() {
    let s = "ghiabcdefhelloadamhelloabcdefghik"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 1)
  }

  func testLongestPossibleChunkedPalindrome5() {
    let s = "antaprezatepzapreanta"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 11)
  }

  func testLongestPossibleChunkedPalindrome6() {
    let s = "merchant"
    let solution = Solution()
    let result = solution.countChunk(s)
    XCTAssertEqual(result, 1)
  }

}

TestLongestPossibleChunkedPalindrome.defaultTestSuite.run()




