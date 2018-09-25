/*:
 # 64. Minimum Path Sum
 
 Given a 2D grid, each cell is either a wall 'W', an enemy 'E' or empty '0' (the number zero), return the maximum enemies you can kill using one bomb.
 The bomb kills all the enemies in the same row and column from the planted point until it hits the wall since the wall is too strong to be destroyed.
 Note that you can only put the bomb at an empty cell.
 
 Example:
 For the given grid
 
 0 E 0 0
 E 0 W E
 0 E 0 0
 
 return 3. (Placing a bomb at (1,1) kills 3 enemies)
 
 func numDecodings(_ s: String) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(mn)
 
 */
class Solution {
  func maxKilledEnemies(_ grid: [[Character]]) -> Int {
    
    guard grid.count > 0 else {
      return 0
    }
    
    let rows = grid.count
    let cols = grid[0].count
    
    let defaultRow = Array(repeating: 0, count: cols)
    var up = Array(repeating: defaultRow, count: rows)
    var down = Array(repeating: defaultRow, count: rows)
    var left = Array(repeating: defaultRow, count: rows)
    var right = Array(repeating: defaultRow, count: rows)
    
    // up
    for i in 0 ..< rows {
      for j in 0 ..< cols {
        if grid[i][j] != "W" {
          if grid[i][j] == "E" {
            up[i][j] = 1
          }
          
          if i - 1 >= 0 {
            up[i][j] = up[i][j] + up[i-1][j]
          }
        }
      }
    }
    
    // down
    for i in (0 ..< rows).reversed() {
      for j in 0 ..< cols {
        if grid[i][j] != "W" {
          if grid[i][j] == "E" {
            down[i][j] = 1
          }
          
          if i + 1 < rows {
            down[i][j] = down[i][j] + down[i+1][j]
          }
        }
      }
    }
    
    // left
    for i in 0 ..< rows {
      for j in 0 ..< cols {
        if grid[i][j] != "W" {
          if grid[i][j] == "E" {
            left[i][j] = 1
          }
          
          if j - 1 >= 0 {
            left[i][j] = left[i][j] + left[i][j-1]
          }
        }
      }
    }
    
    // right
    for i in 0 ..< rows {
      for j in (0 ..< cols).reversed() {
        if grid[i][j] != "W" {
          if grid[i][j] == "E" {
            right[i][j] = 1
          }
          
          if j + 1 < cols {
            right[i][j] = right[i][j] + right[i][j+1]
          }
        }
      }
    }
    
    // find 0, and update max
    var killed = 0
    var result = 0
    for i in 0 ..< rows {
      for j in 0 ..< cols {
        if grid[i][j] == "0" {
          killed = up[i][j] + down[i][j] + left[i][j] + right[i][j]
        }
        
        result = max(result, killed)
      }
    }
    return result
  }
}
/*:
 ## Test
 */
import XCTest

class TestBombEnemy: XCTestCase {
  
  func testBombEnemy() {
    let grid: [[Character]] =
      [
        ["0","E","0", "0"],
        ["E","0","W", "E"],
        ["0","E","0", "0"]
    ]
    
    let solution = Solution()
    let result = solution.maxKilledEnemies(grid)
    XCTAssertEqual(result, 3)
    
  }
  
}

TestBombEnemy.defaultTestSuite.run()
