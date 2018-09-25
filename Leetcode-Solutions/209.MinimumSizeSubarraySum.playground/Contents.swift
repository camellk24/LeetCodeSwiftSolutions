
/*:
 # 209. Minimum Size Subarray Sum
 
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 Example:
 
 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
 
 **Implement below function**
 
 func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 Sliding Window
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    
    let n = nums.count
    var j = 0
    var sum = 0
    var result = Int.max
    
    for i in 0 ..< n {
      
      while j < n && sum < s {
        sum += nums[j]
        j += 1
      }
      
      if sum >= s {
        result = min(result, j - i)
      }

      sum -= nums[i]
    }
    
    if result == Int.max {
      result = 0
    }
    
    return result
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestMinimumSizeSubarraySum: XCTestCase {
  
  func testMinimumSizeSubarraySum() {
    let s = 7
    let nums = [2, 3, 1, 2, 4, 3]
    let solution = Solution()
    let result = solution.minSubArrayLen(s, nums)
    XCTAssertEqual(result, 2)
  }
  
  
}

TestMinimumSizeSubarraySum.defaultTestSuite.run()




