/*:
 # 200. Number of Islands
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:
 
 Input:
 11110
 11010
 11000
 00000
 
 Output: 1
 Example 2:
 
 Input:
 11000
 11000
 00100
 00011
 
 Output: 3
 
 func numIslands(_ grid: [[Character]]) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(nm)
 
 **Space Complexity:** O(1)
 */

// bfs solution is prefer over dfs, because dfs might need to deal with stack overflow issue
class Solution_BFS {
  
  func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 && grid[0].count > 0 else {
      return 0
    }
    var res = 0
    var _grid = grid
    
    for y in 0 ..< _grid.count {
      for x in 0 ..< _grid[0].count {
        if _grid[y][x] == "1" {
          res += 1
          bfs(y, x, &_grid)
        }
      }
    }
    return res
  }
  
  private func bfs(_ y: Int, _ x: Int, _ grid: inout [[Character]]) {
    
    let rows = grid.count
    let cols = grid[0].count
    
    var q: [(y: Int, x: Int)] = [(y, x)]
    
    while !q.isEmpty {
      
      let coordinate = q.removeFirst()
      let y = coordinate.0
      let x = coordinate.1
      
      if !isInBound(y, x, rows, cols) || grid[y][x] != "1" {
        continue
      }
      
      grid[y][x] = "0"
      
      q.append((y+1, x))
      q.append((y-1, x))
      q.append((y, x+1))
      q.append((y, x-1))
    }
    
  }
  
  private func isInBound(_ y: Int, _ x: Int, _ rows: Int, _ cols: Int) -> Bool {
    return y >= 0 && y < rows && x >= 0 && x < cols
  }
}

/*:
 **Time Complexity:** O(nm)
 
 **Space Complexity:** O(1)
 */
class Solution_DFS {
  func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
      return 0
    }
    
    var num = 0
    var mutableGrid = grid
    
    for y in 0 ..< mutableGrid.count {
      for x in 0 ..< mutableGrid[0].count {
        if mutableGrid[y][x] == "1" {
          num += 1
          dfs(&mutableGrid, y, x)
        }
      }
    }
    
    return num
  }
  
  private func dfs(_ grid: inout [[Character]], _ y: Int, _ x: Int) {

    let rows = grid.count
    let cols = grid[0].count
    guard isInBound(y, x, rows, cols) && grid[y][x] == "1" else {
      return
    }
    
    grid[y][x] = "0"
    
    dfs(&grid, y - 1, x)
    dfs(&grid, y, x - 1)
    dfs(&grid, y + 1, x)
    dfs(&grid, y, x + 1)
  }
  
  private func isInBound(_ y: Int, _ x: Int, _ rows: Int, _ cols: Int) -> Bool {
    return y >= 0 && y < rows && x >= 0 && x < cols
  }
}


/*:
 ## Test
 */
import XCTest

class TestNumberOfIsland: XCTestCase {
  
  func testNumberOfIsland1() {
    let testMatrix: [[Character]] = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
    
    let result_bfs = Solution_BFS().numIslands(testMatrix)
    let result_dfs = Solution_DFS().numIslands(testMatrix)
    XCTAssertEqual(result_bfs, 1)
    XCTAssertEqual(result_dfs, 1)
  }
  
  
  
  func testNumberOfIsland2() {
    let testMatrix: [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
    
    let result_bfs = Solution_BFS().numIslands(testMatrix)
    let result_dfs = Solution_DFS().numIslands(testMatrix)
    XCTAssertEqual(result_bfs, 3)
    XCTAssertEqual(result_dfs, 3)
  }
  
}

TestNumberOfIsland.defaultTestSuite.run()
