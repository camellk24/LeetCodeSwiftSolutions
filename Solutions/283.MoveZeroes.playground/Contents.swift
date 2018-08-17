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
 Swap numbers solution
 
 This solution requires more operations on nums
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution_Swap {
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
 
 Make up 0s
 
 This solution requires lease number of operations
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */
class Solution_Non_Swap {
  func moveZeroes(_ nums: inout [Int]) {
    let n = nums.count
    var j = 0
    
    for i in 0 ..< n {
      if nums[i] != 0 {
        nums[j] = nums[i]
        j += 1
      }
    }
    
    for i in j ..< n {
      if nums[i] != 0 {
        nums[i] = 0
      }
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestMoveZeros: XCTestCase {
  
  func testMoveZerosSwap() {
    var testInput = [0,1,0,3,12]
    let solution_swap = Solution_Swap()
    solution_swap.moveZeroes(&testInput)
    XCTAssertEqual(testInput, [1,3,12,0,0])
  }
  
  func testMoveZerosNonSwap() {
    var testInput = [0,1,0,3,12]
    let solution_none_swap = Solution_Non_Swap()
    solution_none_swap.moveZeroes(&testInput)
    XCTAssertEqual(testInput, [1,3,12,0,0])
  }
  
}

TestMoveZeros.defaultTestSuite.run()
