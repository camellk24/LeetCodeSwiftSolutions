/*:
 # 334. Increasing Triplet Subsequence
 
 
 Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.
 
 Formally the function should:
 Return true if there exists i, j, k
 such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.
 Your algorithm should run in O(n) time complexity and O(1) space complexity.
 
 Examples:
 Given [1, 2, 3, 4, 5],
 return true.
 
 Given [5, 4, 3, 2, 1],
 return false.
 

 
 func increasingTriplet(_ nums: [Int]) -> Bool {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution {
  func increasingTriplet(_ nums: [Int]) -> Bool {
    
    guard nums.count >= 3 else {
      return false
    }
    
    var firstMin: Int = Int.max
    var secondMin: Int = Int.max
    
    for i in 0 ..< nums.count {
      let num = nums[i]
      
      if num <= firstMin {
        firstMin = num
      } else if num <= secondMin {
        secondMin = num
      } else {
        return true
      }
    }
    
    return false
  }
}

/*:
 ## Test
 */
import XCTest

class TestIncreasingTripletSubsequence: XCTestCase {
  
  func testIncreasingTripletSubsequence1() {
    let input = [1, 2, 3, 4, 6]
    let solution = Solution()
    let result = solution.increasingTriplet(input)
    XCTAssertEqual(result, true)
  }
  
  func testIncreasingTripletSubsequence2() {
    let input = [5, 4, 3, 2, 1]
    let solution = Solution()
    let result = solution.increasingTriplet(input)
    XCTAssertEqual(result, false)
  }

  
}

TestIncreasingTripletSubsequence.defaultTestSuite.run()
