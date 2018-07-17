/*:
 # 72. Edit Distance
 
 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
 
 You have the following 3 operations permitted on a word:
 
 Insert a character
 Delete a character
 Replace a character
 Example 1:
 
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:
 
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 
 */


/*:
 
 DP - Rolling Array
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(n)
 */
class Solution {
  func minDistance(_ word1: String, _ word2: String) -> Int {
    
    
    // The goal to match word1 & word2
    // so eventually w1.last == w2.last
    
    // four scenarios:
    // xxc vs xxd: replace last one
    // xx vs xxd: add one char
    // xxd vs xx: remove one char
    // xxa vs xxa: no need to do anything
    
    var w1 = Array(word1)
    var w2 = Array(word2)
    
    let m = w1.count
    let n = w2.count
    
    let row = Array(repeating: 0, count: n + 1)
    var f: [[Int]] = Array(repeating: row, count: 2)
    
    f[0][0] = 0
    
    var old = 0
    var now = 0
    
    for i in 0 ... m {
      
      old = now
      now = 1 - old
      
      for j in 0 ... n {
        if i == 0 {
          // need to add j char to make it
          f[now][j] = j
          continue
        }
        
        if j == 0 {
          // need to add i char to make it
          f[now][j] = i
          continue
        }
        
        // xxc vs xxd: replace last one
        // xx vs xxd: add one char
        // xxd vs xx: remove one char
        f[now][j] = min(f[old][j], f[now][j-1], f[old][j-1]) + 1
        
        if w1[i-1] == w2[j-1] {
          // xxa vs xxa: no need to do anything
          f[now][j] = min(f[now][j], f[old][j-1])
        }
      }
    }
    
    return f[now][n]
    
  }
}

/*:
 
 DP - No Rolling Array
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(mn)
 */
class Solution_No_Rolling {
  func minDistance(_ word1: String, _ word2: String) -> Int {
    
    
    
    // The goal to match word1 & word2
    // so eventually w1.last == w2.last
    
    // four scenarios:
    // xxc vs xxd: replace last one
    // xx vs xxd: add one char
    // xxd vs xx: remove one char
    // xxa vs xxa: no need to do anything
    
    var w1 = Array(word1)
    var w2 = Array(word2)
    
    let m = w1.count
    let n = w2.count
    
    let row = Array(repeating: 0, count: n + 1)
    var f: [[Int]] = Array(repeating: row, count: m + 1)
    
    f[0][0] = 0
    
    for i in 0 ... m {
      for j in 0 ... n {
        if i == 0 {
          // need to add j char to make it
          f[i][j] = j
          continue
        }
        
        if j == 0 {
          // need to add i char to make it
          f[i][j] = i
          continue
        }
        
        // xxc vs xxd: replace last one
        // xx vs xxd: add one char
        // xxd vs xx: remove one char
        f[i][j] = min(f[i-1][j], f[i][j-1], f[i-1][j-1]) + 1
        
        if w1[i-1] == w2[j-1] {
          // xxa vs xxa: no need to do anything
          f[i][j] = min(f[i][j], f[i-1][j-1])
        }
      }
    }
    
    return f[m][n]
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestEditDistance: XCTestCase {
  
  func testEditDistance1() {
    let s = "horse"
    let t = "ros"
    let output = 3
    let solution = Solution()
    let result = solution.minDistance(s, t)
    XCTAssertEqual(result, output)
    
    let solution_no_rolling = Solution_No_Rolling()
    let result_no_rolling = solution_no_rolling.minDistance(s, t)
    XCTAssertEqual(result_no_rolling, output)
  }
  
  func testEditDistance2() {
    let s = "intention"
    let t = "execution"
    let output = 5
    let solution = Solution()
    let result = solution.minDistance(s, t)
    XCTAssertEqual(result, output)
    
    let solution_no_rolling = Solution_No_Rolling()
    let result_no_rolling = solution_no_rolling.minDistance(s, t)
    XCTAssertEqual(result_no_rolling, output)
  }
  
}

TestEditDistance.defaultTestSuite.run()
