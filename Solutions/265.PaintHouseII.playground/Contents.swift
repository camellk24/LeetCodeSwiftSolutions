/*:
 # 265. Paint House II
 
 There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x k cost matrix. For example, costs[0][0] is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on... Find the minimum cost to paint all houses.
 
 Note:
 All costs are positive integers.
 
 Example:
 Input: [[1,5,3],[2,9,4]]
 Output: 5
 Explanation: Paint house 0 into color 0, paint house 1 into color 2. Minimum cost: 1 + 4 = 5;
 Or paint house 0 into color 2, paint house 1 into color 0. Minimum cost: 3 + 2 = 5.
 
 func minCostII(_ costs: [[Int]]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(nk)
 
 **Space Complexity:** O(nk)
 
 */
class Solution {
  func minCostII(_ costs: [[Int]]) -> Int {
    
    guard costs.count > 0 else {
      return 0
    }
    
    let numOfHouses = costs.count
    let numOfColors = costs[0].count
    
    // f[i][k]
    
    let defaultColorsRow = Array(repeating: 0, count: numOfColors)
    
    var f: [[Int]] = Array(repeating: defaultColorsRow, count: numOfHouses + 1)
    
    // initialization
    for color in 0 ..< numOfColors {
      f[0][color] = 0
    }
    
    // iterate through all houses
    for i in 1 ... numOfHouses {
      
      // find minimum and second minimum from
      // f[i-1][0] ... f[i-1][numOfColors]
      var minColor = -1
      var secondMinColor = -1
      
      for k in 0 ..< numOfColors {
        if minColor == -1 || f[i-1][k] < f[i-1][minColor] {
          secondMinColor = minColor
          minColor = k
        } else if secondMinColor == -1 || f[i-1][k] < f[i-1][secondMinColor] {
          secondMinColor = k
        }
      }
      
      // handle scenario [[8]]
      if secondMinColor == -1 {
        secondMinColor = minColor
      }
        
      // check current color
      for j in 0 ..< numOfColors {
        
        if j == minColor {
          // if color same as min color, choose second min
          f[i][j] = f[i-1][secondMinColor] + costs[i-1][j]
        } else {
          f[i][j] = f[i-1][minColor] + costs[i-1][j]
        }
      }
      
    }
    
    // iterate through buffer to find min
    var minCost = Int.max
    
    for i in 0 ..< numOfColors {
      minCost = min(minCost, f[numOfHouses][i])
    }
    
    return minCost
  }
}
/*:
 ## Test
 */
import XCTest

class TestPaintHouseII: XCTestCase {
  
  func testPaintHouseII1() {
    let input = [[1, 5, 3], [2, 9, 4]]
    let solution = Solution()
    let result = solution.minCostII(input)
    XCTAssertEqual(result, 5)
  }
  
  func testPaintHouseII2() {
    let input = [[8]]
    let solution = Solution()
    let result = solution.minCostII(input)
    XCTAssertEqual(result, 8)
  }
  
}

TestPaintHouseII.defaultTestSuite.run()
