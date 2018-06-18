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
    
    if word.isEmpty {
      return true
    }
    
    let wordChars = Array(word)
    
    var mutableBoard = board
    
    for y in 0 ..< board.count {
      for x in 0 ..< board[0].count {
        if board[y][x] == wordChars[0] && dfs(&mutableBoard, wordChars, 0, x, y) {
          return true
        }
        
      }
    }
    
    return false
    
  }
  
  private func dfs(_ board: inout [[Character]], _ wordCharacters: [Character], _ wordIndex: Int, _ x: Int, _ y: Int) -> Bool {
    
    // if word index greater than index, means all char get tested, return true
    if wordIndex == wordCharacters.count {
      return true
    }
    
    let rows = board[0].count
    let cols = board.count
    
    // out of bound
    if isOutOfBound(x, y, rows, cols) {
      return false
    }
    
    let testChar = wordCharacters[wordIndex]
    let currChar = board[y][x]
    
    if currChar != testChar {
      return false
    }
    
    board[y][x] = "#" // mark as visiter
    
    
    let found = dfs(&board, wordCharacters, wordIndex + 1, x + 1, y) ||
      dfs(&board, wordCharacters, wordIndex + 1, x - 1, y) ||
      dfs(&board, wordCharacters, wordIndex + 1, x, y + 1) ||
      dfs(&board, wordCharacters, wordIndex + 1, x, y - 1)
    
    // backtrace
    board[y][x] = currChar
    return found
  }
  
  private func isOutOfBound(_ x: Int, _ y: Int, _ rows: Int, _ cols: Int) -> Bool {
    return x < 0 || x >= rows || y < 0 || y >= cols
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
  
  
}

TestWordSearch.defaultTestSuite.run()
