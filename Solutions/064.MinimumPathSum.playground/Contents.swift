/*:
 # 64. Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example:
 
 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 
 func numDecodings(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 Solution w/o optimizing space
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(mn)
 
 */
class Solution_No_Space_Optimization {
  func minPathSum(_ grid: [[Int]]) -> Int {
    
    let rows = grid.count
    
    guard rows > 0 else {
      return 0
    }
    
    let cols = grid[0].count
    
    
    let defaultRow = Array(repeating: 0, count: cols)
    var dp: [[Int]] = Array(repeating: defaultRow, count: rows)
    
    // initialization
    dp[0][0] = grid[0][0]
    
    // initialize first row
    for i in 1 ..< cols {
      dp[0][i] = dp[0][i-1] + grid[0][i]
    }
    
    // initialzie first col
    for i in 1 ..< rows {
      dp[i][0] = dp[i-1][0] + grid[i][0]
    }
    
    
    for i in 1 ..< grid.count {
      for j in 1 ..< grid[0].count {
        // f[i][j] = min {f[i-1][j], f[i][j-1]} + grid[i][j]
        dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
      }
    }
    
    return dp[rows-1][cols-1]
  }
}

/*:
 
 Solution with optimizing space
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(m), m is cols
 
 */
class Solution_Space_Optimization {
  func minPathSum(_ grid: [[Int]]) -> Int {
    
    // f[i][j] = min{f[i-1][j], f[i][j-1]} + grid[i][j]
    
    guard grid.count > 0 else {
      return 0
    }
    
    let rows = grid.count
    let cols = grid[0].count
    
    // init dp with all -1
    let defaultRow = Array(repeating: Int.max, count: cols)
    // use rolling array to store values
    var dp:[[Int]] = Array(repeating: defaultRow, count: 2)
    
    var old = 0
    var now = 0
    
    for i in 0 ..< rows {
      
      // update old, now every time goes to new row
      old = now
      now = 1 - old
      
      for j in 0 ..< cols {
        
        var min = -1
        
        if i > 0 && (min == -1 || dp[old][j] < min)  {
          min = dp[old][j]
        }
        
        if j > 0 && (min == -1 || dp[now][j-1] < min) {
          min = dp[now][j-1]
        }
        
        if min == -1 {
          min = 0
        }
        
        dp[now][j] = min + grid[i][j]
      }
    }
    
    return dp[now][cols-1]
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestMinimumPathSum: XCTestCase {
  
  func testMinimumPathSum() {
    let grid =
    [
      [1,3,1],
      [1,5,1],
      [4,2,1]
    ]
    
    let solution_no_space_op = Solution_No_Space_Optimization()
    let result_no_space_op = solution_no_space_op.minPathSum(grid)
    XCTAssertEqual(result_no_space_op, 7)
    
    let solution_space_op = Solution_Space_Optimization()
    let result_space_op = solution_space_op.minPathSum(grid)
    XCTAssertEqual(result_space_op, 7)
  }
  
}

TestMinimumPathSum.defaultTestSuite.run()
