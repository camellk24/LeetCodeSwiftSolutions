/*:
 # 256. Paint House
 
 There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.
 
 Note:
 All costs are positive integers.
 
 Example:
 
 Input: [[17,2,17],[16,16,5],[14,3,19]]
 Output: 10
 Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
 Minimum cost: 2 + 5 + 3 = 10.
 
 func minCost(_ costs: [[Int]]) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */
class Solution {
  func minCost(_ costs: [[Int]]) -> Int {
    
    guard costs.count > 0 else {
      return 0
    }
    
    let n = costs.count
    let defaultRow = [0, 0, 0]
    var dp: [[Int]] = Array(repeating: defaultRow, count: n)
    
    
    // initialize dp
    dp[0][0] = costs[0][0]
    dp[0][1] = costs[0][1]
    dp[0][2] = costs[0][2]
    
    for i in 1 ..< n {
      
      // f[i][0] = min{ f[i-1][1] + costs[i-1][0], f[i-1][2] + costs[i-1][0] }
      // f[i][1] = min{ f[i-1][0] + costs[i-1][1], f[i-1][2] + costs[i-1][1] }
      // f[i][2] = min{ f[i-1][0] + costs[i-1][2], f[i-1][1] + costs[i-1][2] }
      
      dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + costs[i][0]
      dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + costs[i][1]
      dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + costs[i][2]
    }
    return min(dp[n-1][0], min(dp[n-1][1], dp[n-1][2]))
  }
}

/*:
 ## Test
 */
import XCTest

class TestPaintHouse: XCTestCase {
  
  func testPaintHouse() {
    let costs = [[17,2,17],[16,16,5],[14,3,19]]
    let solution = Solution()
    let result = solution.minCost(costs)
    XCTAssertEqual(result, 10)
  }
  
}

TestPaintHouse.defaultTestSuite.run()
