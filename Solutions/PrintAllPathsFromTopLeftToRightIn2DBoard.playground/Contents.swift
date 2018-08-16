/*:
 # Print All Paths from Top Left to Right in 2D Board
 
 Objective: Print all the paths from left top corner to right bottom corner in two dimensional array.
 
 Input: Two Dimensional array
 
 Output: Print all the paths.
 
 Note: At the End of the article you will know what needs to be included if you want to print the diagonal paths as well.
 
 Example:
 
 [
 [1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]
 ]
 
 Paths:
 1->4->7->8->9
 1->4->5->8->9
 1->4->5->6->9
 1->2->5->8->9
 1->2->5->6->9
 1->2->3->6->9
 
 
 **Implement below function**
 
 func printAllPaths(_ board: [[Int]]) {
 
 }
 
 */

/*:
 DFS - for printing, dfs same more memory space, it didn't need to store any thing, just print
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution_DFS {
  func printAllPaths(_ board: [[Int]]) {
    guard board.count > 0 && board[0].count > 0 else {
      return
    }
    
    dfs(board, 0, 0, "")
  }
  
  private func dfs(_ board: [[Int]], _ y: Int, _ x: Int, _ pathString: String) {
    
    let rows = board.count
    let cols = board[0].count
    
    if !isInBound(y, x, rows, cols) {
      return
    }
    
    let pathValue = board[y][x]
    
    let newPathString: String
    if pathString == "" {
      newPathString = "\(pathValue)"
    } else {
      newPathString = "\(pathString)->\(pathValue)"
    }
    
    if x == cols - 1 && y == rows - 1 {
      print(newPathString)
      return
    }
    
    dfs(board, y + 1, x, newPathString)
    dfs(board, y, x + 1, newPathString)
  }
  
  private func isInBound(_ y: Int, _ x: Int, _ rows: Int, _ cols: Int) -> Bool {
    return y >= 0 && y < rows && x >= 0 && x < cols
  }
}

class Solution_BFS {
  
  func printAllPaths(_ board: [[Int]]) {
    guard board.count > 0 && board[0].count > 0 else {
      return
    }
    
    let rows = board.count
    let cols = board[0].count
    var queue: [(Int, Int, String)] = [(0, 0, "")]
    
    while !queue.isEmpty {
      let res = queue.removeFirst()
      let y = res.0
      let x = res.1
      let currPath = res.2
      
      if !isInBound(y, x, rows, cols) {
        continue
      }
      
      let newPath: String
      if currPath == "" {
        newPath = "\(board[y][x])"
      } else {
        newPath = "\(currPath)->\(board[y][x])"
      }
      
      if y == rows - 1 && x == cols - 1 {
        print(newPath)
        continue
      }
      
      queue.append((y + 1, x, newPath))
      queue.append((y, x + 1, newPath))
    }
  }
  
  private func isInBound(_ y: Int, _ x: Int, _ rows: Int, _ cols: Int) -> Bool {
    return y >= 0 && y < rows && x >= 0 && x < cols
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestPrintAllPathsIn2DBoard: XCTestCase {
  
  func testPrintAllPathsIn2DBoard() {
    let board =  [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    print("\ndfs solution:")
    Solution_DFS().printAllPaths(board)
    
    print("\nbfs solution: \n")
    Solution_BFS().printAllPaths(board)
    
  }
  
}

TestPrintAllPathsIn2DBoard.defaultTestSuite.run()
