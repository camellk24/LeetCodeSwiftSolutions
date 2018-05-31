
/*:
 # 162. Find Peak Element
 
 A peak element is an element that is greater than its neighbors.
 
 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 
 You may imagine that nums[-1] = nums[n] = -∞.
 
 **Example:**
 
 Example 1:
 
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 Example 2:
 
 Input: nums = [1,2,1,3,5,6,4]
 Output: 1 or 5
 Explanation: Your function can return either index number 1 where the peak element is 2,
 or index number 5 where the peak element is 6.
 
 **Implement below function**
 
 func findPeakElement(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */
func findPeakElement(_ nums: [Int]) -> Int {
  
  guard nums.count > 1 else {
    return 0
  }
  
  var start = 0
  var end = nums.count - 1
  
  while (start + 1 < end) {
    
    let mid = (end - start) / 2 + start
    
    if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1] {
      return mid
    } else if nums[mid] < nums[mid + 1] {
      // this will make it faster
      start = mid + 1
    } else {
      // this will make it faster
      end = mid - 1
    }
  }
  
  if nums[start] > nums[end] {
    return start
  } else {
    return end
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestFindPeakElement: XCTestCase {
  
  let testArray: [Int] = [1,2,3,1]
  
  func testFindPeakElement() {
    let result = findPeakElement(testArray)
    XCTAssertEqual(result, 2)
  }
  
  
}

TestFindPeakElement.defaultTestSuite.run()




