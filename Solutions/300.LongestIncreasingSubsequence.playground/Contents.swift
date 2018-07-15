/*:
 # 300. Longest Increasing Subsequence
 

 Given an unsorted array of integers, find the length of longest increasing subsequence.
 
 Example:
 
 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Note:
 
 There may be more than one LIS combination, it is only necessary for you to return the length.
 Your algorithm should run in O(n2) complexity.
 Follow up: Could you improve it to O(n log n) time complexity?
 
 func lengthOfLIS(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 
 */

class Solution {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    
    let n = nums.count
    
    guard n > 0 else {
      return 0
    }
    
    // iterate through each number
    // f[i] = max {1, f[j] + 1|j<i & nums[j] < nums[i]}
    // f[i] means with nums[i] as last number, the longest increasing sequence
    
    var f: [Int] = Array(repeating: 0, count: nums.count)
    
    for i in 0 ..< nums.count {
      f[i] = 1
      for j in 0 ..< i {
        if nums[j] < nums[i] {
          f[i] = max(f[i], f[j] + 1)
        }
      }
    }

    var maxLength = 0
    for k in 0 ..< n {
      maxLength = max(maxLength, f[k])
    }
    
    return maxLength
  }
}

/*:
 ## Test
 */
import XCTest

class TestLongestIncreasingSubsequence: XCTestCase {
  
  func testLongestIncreasingSubsequence() {
    let solution = Solution()
    let result = solution.lengthOfLIS([10,9,2,5,3,7,101,18])
    XCTAssertEqual(result, 4)
  }
  
}

TestLongestIncreasingSubsequence.defaultTestSuite.run()
