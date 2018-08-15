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
    
    guard grid.count > 0 else {
      return 0
    }
    
    var numberOfIsland: Int = 0
    var mutableGrid: [[Character]] = grid
    for y in 0 ..< grid.count {
      for x in 0 ..< grid[y].count {
        if mutableGrid[y][x] == "1" {
          bfs(x: x, y: y, grid: &mutableGrid)
          numberOfIsland += 1
        }
      }
    }
    
    return numberOfIsland
    
  }
  
  func bfs(x: Int, y: Int, grid: inout [[Character]]) {
    
    let deltaX: [Int] = [1, 0, -1, 0]
    let deltaY: [Int] = [0, 1, 0, -1]
    
    var queue: [(x: Int, y: Int)] = []
    queue.append((x, y))
    grid[y][x] = "0"
    
    while (!queue.isEmpty) {
      
      let coordinate = queue.removeFirst()
      
      for i in 0...3 {
        let newX = coordinate.0 + deltaX[i]
        let newY = coordinate.1 + deltaY[i]
        
        if !isInBound(x: newX, y: newY, maxX: grid[0].count - 1, maxY: grid.count - 1) {
          continue
        }
        
        if grid[newY][newX] == "1" {
          grid[newY][newX] = "0"
          queue.append((x: newX, y: newY))
        }
      }
    }
    
    
  }
  
  func isInBound(x: Int, y: Int, maxX: Int, maxY: Int) -> Bool {
    return x >= 0 && y >= 0 && x <= maxX && y <= maxY
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
