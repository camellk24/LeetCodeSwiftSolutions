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
 DFS
 
 **Time Complexity:**
 
 **Space Complexity:**
 */

func printAllPaths(_ board: [[Int]]) -> [[Int]] {
  
  guard board.count > 0 else {
    return []
  }
  
  var result: [[Int]] = []
  dfs(board, 0, 0, [], &result)
  return result
}

private func dfs(_ board: [[Int]], _ x: Int, _ y: Int, _ path: [Int], _ result: inout [[Int]]) {
  
  let rows = board.count
  let cols = board[0].count
  
  if x == cols || y == rows {
    return
  }
  
  let pathValue = board[y][x]
  
  var newPath = path
  newPath.append(pathValue)
  
  if x == cols - 1 && y == rows - 1 {
    printPath(newPath)
    result.append(newPath)
    return
  }
  
  dfs(board, x + 1, y, newPath, &result)
  dfs(board, x, y + 1, newPath, &result)
}

private func printPath(_ path: [Int]) {
  print("path: \(path.map{ "\($0)" }.joined(separator: "->"))")
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
    let result = printAllPaths(board)
    XCTAssertEqual(result, [[1, 4, 7, 8, 9], [1, 4, 5, 8, 9], [1, 4, 5, 6, 9], [1, 2, 5, 8, 9], [1, 2, 5, 6, 9], [1, 2, 3, 6, 9]])
  }
  
}

TestPrintAllPathsIn2DBoard.defaultTestSuite.run()
