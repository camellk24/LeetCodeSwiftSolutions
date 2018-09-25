/*:
 # 88. Merge Sorted Array
 
 Description
 Merge two given sorted integer array A and B into a new sorted integer array.
 
 Have you met this question in a real interview?
 Example
 A=[1,2,3,4]
 
 B=[2,4,5,6]
 
 return [1,2,2,3,4,4,5,6]
 
 Challenge
 How can you optimize your algorithm if one array is very large and the other is very small?
 
 */


/*:
 Prefix Sum
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func merge(_ nums1: inout [Int], _ nums2: [Int]) -> [Int] {
    var res: [Int] = []
    var i = 0
    var j = 0
    
    while i < nums1.count && j < nums2.count {
      if nums1[i] < nums2[j] {
        res.append(nums1[i])
        i += 1
      } else if nums1[i] > nums2[j] {
        res.append(nums2[j])
        j += 1
      } else {
        res.append(nums1[i])
        res.append(nums2[j])
        i += 1
        j += 1
      }
    }
    
    while i < nums1.count {
      res.append(nums1[i])
      i += 1
    }
    
    while j < nums2.count {
      res.append(nums2[j])
      j += 1
    }
    
    return res
  }
}

/*:
 ## Test
 */
import XCTest

class TestMergeTwoSortedArrays: XCTestCase {
  
  func testMergeTwoSortedArrays() {
    var nums1 = [1,2,3]
    let nums2 = [2,5,6]
    let res = Solution().merge(&nums1, nums2)
    XCTAssertEqual(res, [1,2,2,3,5,6])
  }
  
  
}

TestMergeTwoSortedArrays.defaultTestSuite.run()
