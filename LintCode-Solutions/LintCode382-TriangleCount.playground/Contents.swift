/*:
 # LintCode 382 - Triangle Count
 
 Given an array of integers, how many three numbers can be found in the array, so that we can build an triangle whose three edges length is the three numbers that we find?
 Example
 Given array S = [3,4,6,7], return 3. They are:
 [3,4,6]
 [3,6,7]
 [4,6,7]
 Given array S = [4,4,4,4], return 4. They are:
 [4(1),4(2),4(3)]
 [4(1),4(2),4(4)]
 [4(1),4(3),4(4)]
 [4(2),4(3),4(4)]
 
 */


/*:
 **Time Complexity:** O(nlogn) + O(n^2) -> O(n^2)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func triangleCount(_ s: [Int]) -> Int {
    
    var res = 0
    
    // make sure there 3 or more edges
    guard s.count >= 3 else {
      return res
    }
    
    let sorted = s.sorted()
    
    for k in 2 ..< sorted.count {
      
      var i = 0
      var j = k - 1
      
      while i < j {
        if sorted[i] + sorted[j] <= sorted[k] {
          i += 1
        } else {
          res += j - i
          j -= 1
        }
      }
    }
    
    return res
  }
}

/*:
 ## Test
 */
import XCTest

class TestTriangleCount: XCTestCase {
  
  func testTriangleCount1() {
    let s = [3,4,6,7]
    let result = Solution().triangleCount(s)
    XCTAssertEqual(result, 3)
  }

  func testTriangleCount2() {
    let s = [4, 4, 4, 4]
    let result = Solution().triangleCount(s)
    XCTAssertEqual(result, 4)
  }
  
  func testTriangleCount3() {
    let s = [4, 3, 6, 7]
    let result = Solution().triangleCount(s)
    XCTAssertEqual(result, 3)
  }
  
  func testInputCountLessThanThree() {
    let s = [4, 3]
    let result = Solution().triangleCount(s)
    XCTAssertEqual(result, 0)
  }
  
}

TestTriangleCount.defaultTestSuite.run()

