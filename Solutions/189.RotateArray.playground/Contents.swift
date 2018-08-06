/*:
 # 189. Rotate Array
 
 Given an array, rotate the array to the right by k steps, where k is non-negative.
 
 Example 1:
 
 Input: [1,2,3,4,5,6,7] and k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:
 
 Input: [-1,-100,3,99] and k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 Note:
 
 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */


class Solution {
  func rotate(_ nums: inout [Int], _ k: Int) {
    
    // 5 6 7 4 3 2 1
    // 5 6 7 1 2 3 4
    
    let n = nums.count
    let _k = k % n
    
    // reverse all elements
    // 1 2 3 4 5 6 7 -> 7 6 5 4 3 2 1
    reverse(&nums, 0, n - 1)
    
    // reverse first k
    reverse(&nums, 0, _k - 1)
    
    // reverse n - k
    reverse(&nums, _k, n - 1)
  }
  
  private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var i = start
    var j = end
    
    while i < j {
      let temp = nums[j]
      nums[j] = nums[i]
      nums[i] = temp
      i += 1
      j -= 1
    }
  }
}





/*:
 ## Test
 */
import XCTest

class TestRotateArray: XCTestCase {
  
  func testRotateArray1() {
    
    var input = [1,2,3,4,5,6,7]
    let output = [5,6,7,1,2,3,4]
    let k = 3
    
    Solution().rotate(&input, k)
    XCTAssertEqual(input, output)
  }
  
  func testRotateArray2() {
    
    var input = [-1,-100,3,99]
    let output = [3,99,-1,-100]
    let k = 2
    
    Solution().rotate(&input, k)
    XCTAssertEqual(input, output)
  }
  
}

TestRotateArray.defaultTestSuite.run()
