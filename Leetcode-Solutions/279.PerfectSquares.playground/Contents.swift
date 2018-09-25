/*:
 # 279. Perfect Squares
 
 
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
 
 Example 1:
 
 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:
 
 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
 
 func numSquares(_ n: Int) -> Int {
 
 }
 
 Follow up:
 1. 有多少方式把N表示成完全平方数之和（1^2和2^2属于不同的方式）
 
 f[i] means number of combination perfect squares solutions
 iterate through last number
 f[i] = sum{f[i - j^2]} where (1<=j^2<=i)
 here f[0] = 1
 
 
 2. 能不能把n表示成恰好k个完全平方数之和
 
 f[i][j]: can i be k number of perfect square, type [[Bool]]
 
 f[i][j] = OR{f[i-k^2][j-1]} where 1 <= k^2 <= i
 
 find f[n][k] = true/false
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n * sqrt(n))
 
 **Space Complexity:** O(n)
 
 */

class Solution {
  func numSquares(_ n: Int) -> Int {
    
    // iterate through 1...n
    guard n > 0 else {
      return 0
    }
    
    var f = Array(repeating: Int.max, count: n + 1)
    f[0] = 0
    
    // f[i] means the least number of perfect squares for number i
    // f[i] = min{f[i - j^2] where 1<=j^2<=i, f[i]}
    for i in 1 ... n {
      var j = 1
      while j * j <= i {
        f[i] = min(f[i - j * j] + 1, f[i])
        j += 1
      }
    }
    
    return f[n]
  }
  
  
  /// Follow up - 1
  /// 1. 有多少方式把N表示成完全平方数之和（1^2和2^2属于不同的方式）
  /// - Parameter n:
  /// - Returns:
  func allNumSquares(_ n: Int) -> Int {
    // iterate through 1...n
    guard n > 0 else {
      return 0
    }
    
    var f = Array(repeating: Int.max, count: n + 1)
    f[0] = 1 // f[0] = 1
    
    // f[i] means the least number of perfect squares for number i
    // f[i] = sum{f[i - j^2]} where (1<=j^2<=i)
    for i in 1 ... n {
      var j = 1
      var count = 0
      while j * j <= i {
        count += f[i - j * j]
        j += 1
      }
      f[i] = count
    }
    
    return f[n]
  }
}



/*:
 ## Test
 */
import XCTest

class TestPerfectSquare: XCTestCase {
  
  func testPerfectSquare1() {
    let input = 12
    let output = 3
    
    let solution = Solution()
    let result = solution.numSquares(input)
    
    XCTAssertEqual(result, output)
  }
  
  func testPerfectSquare2() {
    let input = 13
    let output = 2
    
    let solution = Solution()
    let result = solution.numSquares(input)
    
    XCTAssertEqual(result, output)
  }
  
  /// Test follow up 1
  func testAllNumPerfectSquares() {
    
    let input = 6
    let output = 4
    
    let solution = Solution()
    let result = solution.allNumSquares(input)
    
    XCTAssertEqual(result, output)
  }

}

TestPerfectSquare.defaultTestSuite.run()
