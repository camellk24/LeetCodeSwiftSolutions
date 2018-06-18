/*:
 # 75. Sort Colors
 
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 
 Note: You are not suppose to use the library's sort function for this problem.
 
 Example:
 
 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 
 
 func sortColors(_ nums: inout [Int]) {
 
 }
 
 */


/*:
 Two Pointers
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func sortColors(_ nums: inout [Int]) {
    
    var left = 0
    var right = nums.count - 1
    var i = 0
    
    while i <= right {
      if nums[i] == 0 {
        // swap nums[i] with nums[left]
        swap(&nums, left, i)
        left += 1
        
        // need to increment i
        i += 1
      } else if nums[i] == 2 {
        // swap nums[i] with nums[right]
        swap(&nums, right, i)
        right -= 1
      } else {
        // nums[i] == 1
        i += 1
      }
    }
  }
  
  private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    guard nums[i] != nums[j] else { return }
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
  }
}

/*:
 ## Test
 */
import XCTest

class TestSortColor: XCTestCase {
  
  func testSortColor() {
    var testColors = [2, 0, 2, 1, 1, 0]
    let solution = Solution()
    solution.sortColors(&testColors)
    XCTAssertEqual(testColors, [0, 0, 1, 1, 2, 2])
  }
  
}

TestSortColor.defaultTestSuite.run()
