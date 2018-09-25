
/*:
 # 153. Find Minimum in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 **Example:**
 
 Example 1:
 
 Input: [3,4,5,1,2]
 Output: 1
 
 Example 2:
 
 Input: [4,5,6,7,0,1,2]
 Output: 0
 
 **Implement below function**
 
 func findMin(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */
func findMin(_ nums: [Int]) -> Int {
  if nums.count == 0 {
    return -1
  }
  if nums.count == 1 {
    return nums[0]
  }
  
  // make the last number as target
  // find the first number less than target
  
  var start = 0
  var end = nums.count - 1
  let target = nums[end]
  
  while (start + 1 < end) {
    
    let mid = (end - start) / 2 + start

    if nums[mid] < target {
      end = mid
    } else {
      start = mid
    }
    
  }
  
  if nums[start] < target {
    return nums[start]
  } else {
    return nums[end]
  }
}

/*:
 ## Test
 */
import XCTest

class TestFindMinInRotatedSortedArray: XCTestCase {

  let testArray: [Int] = [4, 5, 6, 7, 0, 1, 2]

  func testFindMin() {
    let result = findMin(testArray)
    XCTAssertEqual(result, 0)
  }


}

TestFindMinInRotatedSortedArray.defaultTestSuite.run()




