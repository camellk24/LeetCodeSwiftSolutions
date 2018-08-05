
/*:
 # 33. Search in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 **Example:**
 
 Example 1:
 
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:
 
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 **Implement below function**
 
 func search(_ nums: [Int], _ target: Int) -> Int {
 
 }
 
 */

/*:
 ## Drawing graph will help solving this problem
 
 **Time Complexity:** O(logn)
 
 **Space Complexity:** O(1)
 */
class Solution {
  func search(_ nums: [Int], _ target: Int) -> Int {
    
    let n = nums.count
    
    guard n > 0 else {
      return -1
    }
    
    let lastNum = nums[n-1]
    
    if lastNum == target {
      return n - 1
    }
    
    var start = 0
    var end = n - 1
    
    while start + 1 < end {
      
      let mid = (end - start) / 2 + start
      let num = nums[mid]
      
      if num == target {
        return mid
      } else if num > target {
        if (num > lastNum && target > lastNum) || (num < lastNum && target < lastNum) {
          end = mid
        } else {
          start = mid
        }
      } else {
        if (num < lastNum && target < lastNum) || (num > lastNum && target > lastNum) {
          start = mid
        } else {
          end = mid
        }
      }
    }
    
    if nums[start] == target {
      return start
    } else if nums[end] == target {
      return end
    } else {
      return -1
    }
    
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestSearchInRotatedSortedArray: XCTestCase {
  
  let testArray: [Int] = [4, 5, 6, 7, 0, 1, 2]
  
  func testSearch() {
    let result = Solution().search(testArray, 0)
    XCTAssertEqual(result, 4)
  }
  
  
}

TestSearchInRotatedSortedArray.defaultTestSuite.run()




