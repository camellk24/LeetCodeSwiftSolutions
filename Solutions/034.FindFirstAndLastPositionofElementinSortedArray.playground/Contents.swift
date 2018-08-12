/*:
 # 34. Find First and Last Position of Element in Sorted Array
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 
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




