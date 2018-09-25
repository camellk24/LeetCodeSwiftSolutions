/*:
 # 289. Game of Life
 
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.
 
 */


/*:
 **Time Complexity:**
 
 **Space Complexity:**
 */

class Solution {
  func gameOfLife(_ board: inout [[Int]]) {
    
    guard board.count > 0 else {
      return
    }
    
    var _board: [[Int]] = board
    
    let deltaX = [-1, -1, -1, 0, 0, 1, 1, 1]
    let deltaY = [0, -1, 1, -1, 1, -1, 0, 1]
    let rows = _board.count
    let cols = _board[0].count
    
    for i in 0 ..< _board.count {
      for j in 0 ..< _board[0].count {
        var livesCount = 0
        for k in 0 ... 7 {
          let _i = i + deltaX[k]
          let _j = j + deltaY[k]
          if isInBound(_i, _j, rows, cols) && _board[_i][_j] == 1 {
            livesCount += 1
          }
        }
        if _board[i][j] == 0 && livesCount == 3 {
          board[i][j] = 1
        } else if _board[i][j] == 1 {
          if livesCount < 2 || livesCount > 3 {
            board[i][j] = 0
          }
        }
      }
    }
  }
  
  private func isInBound(_ i: Int, _ j: Int, _ rows: Int, _ cols: Int) -> Bool {
    return i >= 0 && i < rows && j >= 0 && j < cols
  }
  
  
}


/*:
 ## Test
 */
import XCTest

class TestGameOfLife: XCTestCase {
  
  func testGameOfLife() {
    var board = [
      [0,1,0],
      [0,0,1],
      [1,1,1],
      [0,0,0]
    ]
    
    Solution().gameOfLife(&board)
    
    XCTAssertEqual(board, [
      [0,0,0],
      [1,0,1],
      [0,1,1],
      [0,1,0]
      ])
  }
  
}

TestGameOfLife.defaultTestSuite.run()
