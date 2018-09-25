/*:
 # 53. Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:
 
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 
 func maxSubArray(_ nums: [Int]) -> Int {
 
 }
 
 */


/*:
 Prefix Sum
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

func maxSubArrayPrefixSum(_ nums: [Int]) -> Int {
  
  guard nums.count > 0 else {
    return 0
  }
  
  // subarray(i,j) = prefixsum(j) - prefixsum(i-1)
  
  var subarraySum = Int.min
  var minPrefixSum = 0 // empty array
  var maxPrefixSum = 0
  for i in 0 ..< nums.count {
    maxPrefixSum += nums[i]
    subarraySum = max(maxPrefixSum - minPrefixSum, subarraySum)
    minPrefixSum = min(maxPrefixSum, minPrefixSum)
  }
  return subarraySum
}

/*:
 Greedy Method
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */
func maxSubArrayGreedy(_ nums: [Int]) -> Int {
  
  guard nums.count > 0 else {
    return 0
  }
  
  var _max = Int.min
  var sum = 0
  for i in 0 ..< nums.count {
    sum += nums[i]
    _max = max(sum, _max)
    sum = max(sum, 0)
  }
  
  return _max
}


/*:
 ## Test
 */
import XCTest

class TestMaximumSubarray: XCTestCase {
  
  func testMaximumSubarrayPrefixSum() {
    let result = maxSubArrayPrefixSum([-2,1,-3,4,-1,2,1,-5,4])
    XCTAssertEqual(result, 6)
  }
  
  func testMaximumSubarrayGreedy() {
    let result = maxSubArrayGreedy([-2,1,-3,4,-1,2,1,-5,4])
    XCTAssertEqual(result, 6)
  }
  
}

TestMaximumSubarray.defaultTestSuite.run()
