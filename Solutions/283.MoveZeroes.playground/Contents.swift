/*:
 # 283. Move Zeroes
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 Example:
 
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:
 
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 
 
func moveZeroes(_ nums: inout [Int]) {
 
 }
 
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func moveZeroes(_ nums: inout [Int]) {
    
    var j = 0
    
    for i in 0 ..< nums.count {
      while j < nums.count && nums[j] == 0 {
        j += 1
      }
      
      if j < nums.count && nums[i] == 0 {
        let temp = nums[j]
        nums[j] = nums[i]
        nums[i] = temp
      }
      
      j+=1
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestMoveZeros: XCTestCase {
  
  func testMoveZeros() {
    var testInput = [0,1,0,3,12]
    let solution = Solution()
    solution.moveZeroes(&testInput)
    XCTAssertEqual(testInput, [1,3,12,0,0])
  }
  
}

TestMoveZeros.defaultTestSuite.run()
