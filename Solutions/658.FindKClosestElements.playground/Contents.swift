/*:
 # 658. Find K Closest Elements
 
 Given a sorted array, two integers k and x, find the k closest elements to x in the array. The result should also be sorted in ascending order. If there is a tie, the smaller elements are always preferred.
 
 Example 1:
 Input: [1,2,3,4,5], k=4, x=3
 Output: [1,2,3,4]
 Example 2:
 Input: [1,2,3,4,5], k=4, x=-1
 Output: [1,2,3,4]
 Note:
 The value k is positive and will always be smaller than the length of the sorted array.
 Length of the given array is positive and will not exceed 104
 Absolute value of elements in the array and x will not exceed 104

 
 func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
 
 }
 
 */


/*:
 
 **Time Complexity:** O(log(n)+k). O(log(n))O(log(n)) is for the time of binary search, while O(k)O(k) is for shrinking the index range to k elements.
 
 **Space Complexity:** O(k). It is to generate the required sublist.
 
 */

class Solution {
    
  func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    
    guard arr.count > k else {
      return arr
    }
    
    // 0 ...... M ...... < N
    // max left bound => N - k
    // 0 ...... M .... I .... M + k ... N - k
    
    var start = 0
    var end = arr.count - k
    
    while (start < end) {
      let mid = start + (end - start) / 2
      
      if x > arr[mid] {
        if (x - arr[mid]) > (arr[mid + k] - x) {
          start += 1
        } else {
          end = mid
        }
      } else {
        end = mid
      }
    }
    
    var result = Array<Int>(repeating: 0, count: k)
    for i in 0 ..< k {
      result[i] = arr[start]
      start += 1
    }
    return result
    
  }
}


/*:
 ## Test
 */
import XCTest

class TestFindClosestElements: XCTestCase {
  
  func testFindClosestElements1() {
    let testArray: [Int] = [1, 2, 3, 4, 5]
    let solution = Solution()
    let result = solution.findClosestElements(testArray, 4, 3)
    XCTAssertEqual(result, [1, 2, 3, 4])
  }
  
}

TestFindClosestElements.defaultTestSuite.run()
