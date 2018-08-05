/*:
 # 674. Longest Continuous Increasing Subsequence
 
 Given an unsorted array of integers, find the length of longest continuous increasing subsequence (subarray).
 
 Example 1:
 Input: [1,3,5,4,7]
 Output: 3
 Explanation: The longest continuous increasing subsequence is [1,3,5], its length is 3.
 Even though [1,3,5,7] is also an increasing subsequence, it's not a continuous one where 5 and 7 are separated by 4.
 Example 2:
 Input: [2,2,2,2,2]
 Output: 1
 Explanation: The longest continuous increasing subsequence is [2], its length is 1.
 
 func countBits(_ num: Int) -> [Int] {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */
class Solution {
  func findLengthOfLCIS(_ nums: [Int]) -> Int {
    
    // check empty array
    guard nums.count > 0 else {
      return 0
    }
    
    
    // by default set len to 1
    var currLen = 1
    var maxLen = 1
    
    for i in 0 ..< nums.count - 1 {
      
      if nums[i] < nums[i+1] {
        currLen += 1
      } else {
        currLen = 1
      }
      
      maxLen = max(currLen, maxLen)
    }
    
    return maxLen
  }
}
/*:
 ## Test
 */
import XCTest

class TestLongestContinuousIncreasingSubsequence: XCTestCase {
  
  func testLongestContinuousIncreasingSubsequence1() {
    let input = [1, 3, 5, 4, 7]
    let solution = Solution()
    let result = solution.findLengthOfLCIS(input)
    XCTAssertEqual(result, 3)
  }
  
  func testLongestContinuousIncreasingSubsequence2() {
    let input = [2, 2, 2, 2, 2]
    let solution = Solution()
    let result = solution.findLengthOfLCIS(input)
    XCTAssertEqual(result, 1)
  }
  
}

TestLongestContinuousIncreasingSubsequence.defaultTestSuite.run()
