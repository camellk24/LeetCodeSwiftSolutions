/*:
 # 63. Unique Paths II
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 Now consider if some obstacles are added to the grids. How many unique paths would there be?
 
 
 
 An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 
 Note: m and n will be at most 100.
 
 Example 1:
 
 Input:
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 Output: 2
 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right
 
 
 func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(mn)
 
 */
class Solution {
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    
    guard obstacleGrid.count > 0 else {
      return 0
    }
    
    // create mutable copy of obstacleGrid
    var grid = obstacleGrid
    
    let rows = grid.count
    let cols = grid[0].count
    
    let defaultRow = Array(repeating: 0, count: cols)
    var paths: [[Int]] = Array(repeating: defaultRow, count: rows)
    
    // check obstacles in first cols
    // if 0, mark paths 1
    // if 1, break loop
    for i in 0 ..< rows {
      if grid[i][0] != 1 {
        paths[i][0] = 1
      } else {
        break
      }
    }
    
    // check obstacles in first rows
    // if 0, mark paths 1
    // if 1, break loop
    for i in 0 ..< cols {
      if grid[0][i] != 1 {
        paths[0][i] = 1
      } else {
        break
      }
    }
    
    for i in 1 ..< rows {
      for j in 1 ..< cols {
        if grid[i][j] != 1 {
          paths[i][j] = paths[i-1][j] + paths[i][j-1]
        } else {
          paths[i][j] = 0
        }
      }
    }
    
    
    return paths[rows-1][cols-1]
  }
}
/*:
 ## Test
 */
import XCTest

class TestUniquePathsII: XCTestCase {
  
  func testUniquePathsII() {
    let grid = [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
    let solution = Solution()
    let result = solution.uniquePathsWithObstacles(grid)
    XCTAssertEqual(result, 2)
  }
  
}

TestUniquePathsII.defaultTestSuite.run()
