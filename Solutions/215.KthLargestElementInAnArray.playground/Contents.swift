/*:
 # 215. Kth Largest Element in an Array
 
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 Example 1:
 
 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 Example 2:
 
 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 
 
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
 
 }
 
 */


/*:
 Quick select solution
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var mutableNums = nums
    return quickSelect(&mutableNums, 0, nums.count - 1, k)
  }
  
  // use quick select
  // take nums, left bound, right bound, k
  // return k largest
  func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
    
    var i = left
    var j = right
    let pivot = nums[(left + right) / 2] // take middle point as pivot
    
    // partition
    while (i <= j) {
      
      // move i if nums[i] > pivot
      while (i <= j && nums[i] > pivot) {
        i += 1
      }
      
      // move j if nums[j] < pivot
      while (i <= j && nums[j] < pivot) {
        j -= 1
      }
      
      if i <= j {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
        i += 1
        j -= 1
      }
    }
    
    // quick select left partition, if k is within left partition
    if (left + k - 1 <= j) {
      return quickSelect(&nums, left, j, k)
    }
    
    // quick select right partition, if k is within right partition
    if (left + k - 1 >= i) {
      return quickSelect(&nums, i, right, (k - (i - left)))
    }
    
    return nums[j+1]
  }
}

/*:
 ## Test
 */
import XCTest

class TestFindKthLargest: XCTestCase {
  
  func testFindKthLargest1() {
    let solution = Solution()
    let result = solution.findKthLargest([3,2,1,5,6,4], 2)
    XCTAssertEqual(result, 5)
  }
  
  func testFindKthLargest2() {
    let solution = Solution()
    let result = solution.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
    XCTAssertEqual(result, 4)
  }
  
}

TestFindKthLargest.defaultTestSuite.run()
