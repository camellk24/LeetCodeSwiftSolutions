
/*:
 # 81. Search in Rotated Sorted Array II
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
 
 You are given a target value to search. If found in the array return true, otherwise return false.
 
 Example 1:
 
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 Example 2:
 
 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 Follow up:
 
 This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
 Would this affect the run-time complexity? How and why?
 
 */

/*:
 ## Drawing graph will help solving this problem
 
 **Time Complexity:** O(logn), worse case O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func search(_ nums: [Int], _ target: Int) -> Bool {
    
    let n = nums.count
    
    guard n > 0 else {
      return false
    }
    
    var start = 0
    var end = n - 1
    
    let firstNum = nums[start]
    let lastNum = nums[end]
    
    if lastNum == target || firstNum == target {
      return true
    }
    
    while start + 1 < end {
      
      let mid = (end - start) / 2 + start
      let num = nums[mid]
      
      if num == target {
        return true
      } else if num > target {
        if (num > lastNum && target > lastNum) || (num < lastNum && target < lastNum) {
          end = mid
        } else if mid > lastNum && target < lastNum {
          start = mid
        } else {
          // if num == lastNum, it's possible that duplicate on first half or second half
          // try increment start see if it's the same number
          // if it's the same then increment start
          // otherwise, decrement end
          if start + 1 < n && nums[start + 1] == num {
            start += 1
          } else {
            end -= 1
          }
        }
      } else {
        if (num > lastNum && target > lastNum) || (num < lastNum && target < lastNum) {
          start = mid
        } else if mid < lastNum && target > lastNum {
          end = mid
        } else {
          // num == lastNum
          if start + 1 < n && nums[start + 1] == num {
            start += 1
          } else {
            end -= 1
          }
        }
      }
    }
    
    return (nums[start] == target) || (nums[end] == target)
  }
}

/*:
 ## Test
 */
import XCTest

class TestSearchInRotatedSortedArrayII: XCTestCase {
  
  func testSearch1() {
    let testArray: [Int] = [2,5,6,0,0,1,2]
    let result = Solution().search(testArray, 0)
    XCTAssertEqual(result, true)
  }
  
  func testSearch2() {
    let testArray: [Int] = [2,5,6,0,0,1,2]
    let result = Solution().search(testArray, 3)
    XCTAssertEqual(result, false)
  }
  
  func testSearch3() {
    let testArray: [Int] = [1, 1, 1, 3, 1]
    let result = Solution().search(testArray, 3)
    XCTAssertEqual(result, true)
  }
  
  func testSearch4() {
    let testArray: [Int] = [1, 3, 1, 1, 1]
    let result = Solution().search(testArray, 3)
    XCTAssertEqual(result, true)
  }
  
  
}

TestSearchInRotatedSortedArrayII.defaultTestSuite.run()




