/*:
 # 36. Valid Sudoku
 
 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 
 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 
 A partially filled sudoku which is valid.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 Example 1:
 
 Input:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true
 Example 2:
 
 Input:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being
 modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 Note:
 
 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 The given board contain only digits 1-9 and the character '.'.
 The given board size is always 9x9.

 
 
 func wordsAbbreviation(_ dict: [String]) -> [String] {
 
 }
 
 
 */


/*:
 
 Time Complexity: O(1)
 
 Space Complexity: O(1)
 
 */

class Solution {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    guard board.count == 9 && board[0].count == 9 else {
      return false
    }
    
    // check each row
    for i in 0 ..< 9 {
      // reset visited
      var visited: [Bool] = Array(repeating: false, count: 9)
      for j in 0 ..< 9 {
        if !isValid(&visited, board[i][j]) {
          return false
        }
      }
    }
    
    // check each col
    for i in 0 ..< 9 {
      // reset visited
      var visited: [Bool] = Array(repeating: false, count: 9)
      for j in 0 ..< 9 {
        if !isValid(&visited, board[j][i]) {
          return false
        }
      }
    }
    
    // check each sub 3 * 3
    for i in stride(from: 0, to: 9, by: 3) {
      for j in stride(from: 0, to: 9, by: 3) {
        var visited: [Bool] = Array(repeating: false, count: 9)
        for k in 0 ..< 9 {
          if !isValid(&visited, board[i + k/3][j + k%3]) {
            return false
          }
        }
      }
    }
    
    return true
  }
  
  private func isValid(_ visited: inout [Bool], _ char: Character) -> Bool {
    if let num = getNum(char) {
      if visited[num - 1] {
        return false
      } else {
        visited[num - 1] = true
        return true
      }
    } else {
      return true
    }
  }
  
  private func getNum(_ char: Character) -> Int? {
    switch char {
    case "1":
      return 1
    case "2":
      return 2
    case "3":
      return 3
    case "4":
      return 4
    case "5":
      return 5
    case "6":
      return 6
    case "7":
      return 7
    case "8":
      return 8
    case "9":
      return 9
    default:
      return nil
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestValidSudoku: XCTestCase {
  
  func testValidSudoku1() {
    
    let board: [[Character]] = [
      ["5","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","."],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".",".","7","9"]
    ]
    
    let solution = Solution()
    let result = solution.isValidSudoku(board)
    XCTAssertEqual(result, true)
  }
  
  func testValidSudoku2() {
    
    let board: [[Character]] = [
      ["8","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","."],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".",".","7","9"]
    ]
    
    let solution = Solution()
    let result = solution.isValidSudoku(board)
    XCTAssertEqual(result, false)
  }
  
}

TestValidSudoku.defaultTestSuite.run()
