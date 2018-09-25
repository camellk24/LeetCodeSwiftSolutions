/*:
 # 15. 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 
 The solution set must not contain duplicate triplets.
 
 Example:
 
 Given array nums = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 
 func threeSum(_ nums: [Int]) -> [[Int]] {
 
 }
 
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var result: [[Int]] = []
    
    guard nums.count > 2 else {
      return result
    }
    
    // a + b = -c
    let sortedArray = nums.sorted()
    
    for i in 0 ..< sortedArray.count - 2 {
      // skip duplicates
      if i > 0 && sortedArray[i] == sortedArray[i - 1] {
        continue
      }
      let target = -sortedArray[i]
      let left = i + 1
      let right = sortedArray.count - 1
      twoSum(sortedArray, left, right, target, &result)
    }
    
    return result
  }
  
  private func twoSum(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int, _ result: inout [[Int]]) {
    
    var i = left
    var j = right
    
    while i < j {
      if nums[i] + nums[j] == target {
        result.append([-target, nums[i], nums[j]])
        i += 1
        j -= 1
        
        // skip duplicate
        while i < j && nums[i] == nums[i - 1] {
          i += 1
        }
        
        // skip duplicate
        while i < j && nums[j] == nums[j + 1] {
          j -= 1
        }
      } else if nums[i] + nums[j] < target {
        i += 1
      } else {
        j -= 1
      }
    }
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestThreeSum: XCTestCase {
  
  func testThreeSum() {
    let testNums = [-1, 0, 1, 2, -1, -4]
    let solution = Solution()
    let result = solution.threeSum(testNums)
    XCTAssertEqual(result, [[-1, -1, 2], [-1, 0, 1]])
  }
  
}

TestThreeSum.defaultTestSuite.run()
