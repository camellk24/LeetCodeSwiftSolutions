
/*:
 # LintCode 443 - Two Sum II
 
 Given an array of integers, find how many pairs in the array such that their sum is bigger than a specific target number. Please return the number of pairs.
 Example
 Given numbers = [2, 7, 11, 15], target = 24. Return 1. (11 + 15 is the only pair)
 Challenge
 Do it in O(1) extra space and O(nlogn) time.
 
 */

/*:
 
 Two Pointers
 
 **Time Complexity:** O(nlogn) + O(n) -> O(nlogn)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func twoSumII(_ nums: [Int], _ target: Int) -> Int {
    
    let n = nums.count
    
    guard n > 0 else {
      return 0
    }
    
    var sum = 0
    var i = 0
    var j = n - 1
    
    while i < j {
      if nums[i] + nums[j] <= target {
        i += 1
      } else {
        sum += j - i
        j -= 1
      }
    }
    
    return sum
  }
}




/*:
 ## Test
 */
import XCTest

class TestTwoSumII: XCTestCase {
  
  func testTwoSumII() {
    let nums = [2, 7, 11, 15]
    let target = 24
    let solution = Solution()
    let result = solution.twoSumII(nums, target)
    XCTAssertEqual(result, 1)
  }
  
}

TestTwoSumII.defaultTestSuite.run()




