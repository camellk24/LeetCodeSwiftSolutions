
/*:
 # 228. Summary Ranges
 

 Given a sorted integer array without duplicates, return the summary of its ranges.
 
 Example 1:
 
 Input:  [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
 Example 2:
 
 Input:  [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.
 
 **Implement below function**
 
 func summaryRanges(_ nums: [Int]) -> [String] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */

class Solution {
  func summaryRanges(_ nums: [Int]) -> [String] {
    let n = nums.count
    var i = 0
    var result: [String] = []
    
    while i < n {
      var j = 1
      
      while i + j < n && nums[i + j] - nums[i] == j {
        j += 1
      }
      
      if j == 1 {
        result.append("\(nums[i])")
      } else {
        result.append("\(nums[i])->\(nums[i + j - 1])")
      }
      
      i = i + j
    }
    
    return result
  }
}





/*:
 ## Test
 */
import XCTest

class TestSummaryRanges: XCTestCase {
  
  func testSummaryRanges1() {
    let input = [0, 1, 2, 4, 5, 7]
    let output = ["0->2", "4->5", "7"]
    let solution = Solution()
    let result = solution.summaryRanges(input)
    XCTAssertEqual(result, output)
  }
  
  func testSummaryRanges2() {
    let input = [0, 2, 3, 4, 6, 8, 9]
    let output = ["0", "2->4", "6", "8->9"]
    let solution = Solution()
    let result = solution.summaryRanges(input)
    XCTAssertEqual(result, output)
  }
}

TestSummaryRanges.defaultTestSuite.run()




