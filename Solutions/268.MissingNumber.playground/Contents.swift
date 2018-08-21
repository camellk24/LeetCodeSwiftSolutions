/*:
 # 268. Missing Number
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 Example 1:
 
 Input: [3,0,1]
 Output: 2
 Example 2:
 
 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 
 */

/*:
 
 Time Complexity: O(n)
 Space Complexity: O(1)
 
 */

class Solution {
  func missingNumber(_ nums: [Int]) -> Int {
    var expectedSum = 0
    var actualSum = 0
    
    for i in 1 ... nums.count {
      expectedSum += i
    }
    
    for i in 0 ..< nums.count {
      actualSum += nums[i]
    }
    
    return expectedSum - actualSum
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestMissingNumber: XCTestCase {
  
  func testMissingNumber1() {
    let nums = [3, 0, 1]
    let res = Solution().missingNumber(nums)
    XCTAssertEqual(res, 2)
  }
  
  func testMissingNumber2() {
    let nums = [9,6,4,2,3,5,7,0,1]
    let res = Solution().missingNumber(nums)
    XCTAssertEqual(res, 8)
  }
  
}

TestMissingNumber.defaultTestSuite.run()
