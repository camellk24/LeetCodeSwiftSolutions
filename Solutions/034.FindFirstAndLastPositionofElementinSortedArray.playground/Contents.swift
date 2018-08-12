/*:
 # 34. Find First and Last Position of Element in Sorted Array
 
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 Example 1:
 
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:
 
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

/*:
 ## Binary Search
 
 **Time Complexity:** O(logn).
 
 **Space Complexity:** O(1).
 
 */
class Solution {
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    guard nums.count > 0 else {
      return [-1, -1]
    }
    
    
    var result: [Int] = []
    var start = 0
    var end = nums.count - 1
    
    // find first position
    while start + 1 < end {
      let mid = (end - start) / 2 + start
      if nums[mid] == target {
        end = mid
      } else if nums[mid] < target {
        start = mid
      } else {
        end = mid
      }
    }
    
    if nums[start] == target {
      result.append(start)
    } else if nums[end] == target {
      result.append(end)
    } else {
      result.append(-1)
    }
    
    // find last position
    start = 0
    end = nums.count - 1
    
    while (start + 1 < end) {
      let mid = (end - start) / 2 + start
      if nums[mid] == target {
        start = mid
      } else if nums[mid] < target {
        start = mid
      } else {
        end = mid
      }
    }
    
    if nums[end] == target {
      result.append(end)
    } else if nums[start] == target {
      result.append(start)
    } else {
      result.append(-1)
    }
    
    return result
  }
}

/*:
 ## Test
 */
import XCTest

class TestFindFirstandLastPositionofElementinSortedArray: XCTestCase {
  
  func testFindFirstandLastPositionofElementinSortedArray1() {
    let nums = [5, 7, 7, 8, 8, 10]
    let target = 8
    let result = Solution().searchRange(nums, target)
    XCTAssertEqual(result, [3, 4])
  }
  
  func testFindFirstandLastPositionofElementinSortedArray2() {
    let nums = [5, 7, 7, 8, 8, 10]
    let target = 6
    let result = Solution().searchRange(nums, target)
    XCTAssertEqual(result, [-1, -1])
  }
  
  func testFindFirstandLastPositionofElementinSortedArray3() {
    let nums = [5, 7, 8, 8, 8, 10]
    let target = 7
    let result = Solution().searchRange(nums, target)
    XCTAssertEqual(result, [1, 1])
  }
  
}

TestFindFirstandLastPositionofElementinSortedArray.defaultTestSuite.run()




