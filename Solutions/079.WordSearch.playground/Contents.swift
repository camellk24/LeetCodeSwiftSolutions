/*:
 # 79. Word Search
 
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example:
 
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 
 
 func exist(_ board: [[Character]], _ word: String) -> Bool {
 
 }
 
 */


/*:
 
 DFS Solution
 
 reference: http://www.cnblogs.com/yuzhangcmu/p/4040418.html
 
 assume m X n is board size, k is word size.
 
 **Time Complexity:** m*n*4^(k-1) -> O(m*n*4^k)
 
 **Space Complexity:** O(k) + O(m*n)(visit array)
 */

class Solution {
  
  func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    guard board.count > 0 else {
      return false
    }
    
    let chars = Array(word)
    
    guard chars.count > 0 else {
      return true
    }
    
    
    var mutableBoard = board
    
    for y in 0 ..< board.count {
      for x in 0 ..< board[0].count {
        if board[y][x] == chars[0] && dfs(&mutableBoard, chars, 0, x, y) {
          return true
        }
      }
    }
    
    return false
    
  }
  
  private func dfs(_ board: inout [[Character]], _ chars: [Character], _ index: Int, _ x: Int, _ y: Int) -> Bool {
    
    // check word index
    if index == chars.count {
      return true
    }
    
    let rows = board.count
    let cols = board[0].count
    
    // check out of bound
    if !isInBound(x, y, cols, rows) {
      return false
    }
    
    let testChar = chars[index]
    let currChar = board[y][x]
    
    // check test char
    if testChar != currChar {
      return false
    }
    
    // mark as visited
    board[y][x] = "#"
    
    let result =
      dfs(&board, chars, index + 1, x + 1, y) ||
      dfs(&board, chars, index + 1, x, y + 1) ||
      dfs(&board, chars, index + 1, x - 1, y) ||
      dfs(&board, chars, index + 1, x, y - 1)
    
    // backtrace
    board[y][x] = currChar
    
    
    return result
  }
  
  private func isInBound(_ x: Int, _ y: Int, _ cols: Int, _ rows: Int) -> Bool {
    return x >= 0 && x < cols && y >= 0 && y < rows
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestWordSearch: XCTestCase {
  
  let board: [[Character]] = [
    ["A", "B", "C", "E"],
    ["S", "F", "C", "S"],
    ["A", "D", "E", "E"]
  ]
  
  func testWordSearch1() {
    let solution = Solution()
    let result = solution.exist(board, "ABCCED")
    XCTAssertTrue(result)
  }

  func testWordSearch2() {
    let solution = Solution()
    let result = solution.exist(board, "SEE")
    XCTAssertTrue(result)
  }

  func testWordSearch3() {
    let solution = Solution()
    let result = solution.exist(board, "ABCB")
    XCTAssertFalse(result)
  }
  
  func testWordSearch4() {
    let testBoard: [[Character]] = [["b", "b"], ["a", "b"], ["b", "a"]]
    let solution = Solution()
    let result = solution.exist(testBoard, "a")
    XCTAssertTrue(result)
  }
  
  
}

TestWordSearch.defaultTestSuite.run()
