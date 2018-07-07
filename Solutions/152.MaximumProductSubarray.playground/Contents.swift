/*:
 # 152. Maximum Product Subarray
 
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.
 
 Example 1:
 
 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:
 
 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 
 func maxProduct(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 Dynamic Programming
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */
class Solution {
  func maxProduct(_ nums: [Int]) -> Int {
    
    // if a[j] is positive, we want f[j-1] max
    // f[j] = max{nums[j], max{nums[j]*f[j-1], a[j]*g[j-1]}}
    
    // if a[j] is negative, we want g[j-1] min
    // f[j] = min{nums[j], min{nums[j]*f[j-1], a[j]*g[j-1]}}
    
    // f[0] = nums[0]
    
    var maxProd: [Int] = Array(repeating: 0, count: nums.count)
    var minProd: [Int] = Array(repeating: 0, count: nums.count)
    maxProd[0] = nums[0]
    minProd[0] = nums[0]
    var result = nums[0]
    
    for i in 1 ..< nums.count {
      let num = nums[i]
      if num > 0 {
        maxProd[i] = max(num, maxProd[i-1] * num)
        minProd[i] = min(num, minProd[i-1] * num)
      } else {
        maxProd[i] = max(num, minProd[i-1] * num)
        minProd[i] = min(num, maxProd[i-1] * num)
      }
      result = max(maxProd[i], result)
    }
    
    return result
  }
}

/*:
 ## Test
 */
import XCTest

class TestMaximumProductSubarray: XCTestCase {
  
  func testMaximumProductSubarray1() {
    let input = [2, 3, -2, 4]
    let solution = Solution()
    let result = solution.maxProduct(input)
    XCTAssertEqual(result, 6)
  }
  
  func testMaximumProductSubarray2() {
    let input = [-2, 0, -1]
    let solution = Solution()
    let result = solution.maxProduct(input)
    XCTAssertEqual(result, 0)
  }
  
}

TestMaximumProductSubarray.defaultTestSuite.run()

