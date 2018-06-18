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
  var results = [[Int]]()
  dfs(board, 0, 0, [], &results)
  return results
}

private func dfs(_ board: [[Int]], _ i: Int, _ j: Int, _ path: [Int], _ results: inout [[Int]]) {
  
  let rows = board.count
  let cols = board[0].count
  
  if i > rows - 1 || j > cols - 1 {
    return
  }
  
  var mutablePath = path
  mutablePath.append(board[i][j])
  
  if i == rows - 1 && j == cols - 1 {
    results.append(mutablePath)
    return
  }
  
  dfs(board, i+1, j, mutablePath, &results)
  dfs(board, i, j+1, mutablePath, &results)

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
