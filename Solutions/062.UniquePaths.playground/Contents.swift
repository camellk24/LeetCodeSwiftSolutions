/*:
 # 62. Unique Paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 
 
 Above is a 7 x 3 grid. How many possible unique paths are there?
 
 Note: m and n will be at most 100.
 
 Example 1:
 
 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 Example 2:
 
 Input: m = 7, n = 3
 Output: 28
 
 
 func uniquePaths(_ m: Int, _ n: Int) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(mn)
 
 **Space Complexity:** O(mn)
 
 */
class Solution {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
    let rows = Array(repeating: 0, count: m)
    var f: [[Int]] = Array(repeating: rows, count: n)
    
    for i in 0 ..< n {
      for j in 0 ..< m {
        if i == 0 || j == 0 {
          f[i][j] = 1
        } else {
          f[i][j] = f[i - 1][j] + f[i][j - 1]
        }
      }
    }
    return f[n-1][m-1]
    
  }
}
/*:
 ## Test
 */
import XCTest

class TestUniquePaths: XCTestCase {
  
  func testUniquePaths1() {
    let m = 3, n = 2
    let solution = Solution()
    let result = solution.uniquePaths(m, n)
    XCTAssertEqual(result, 3)
  }
  
  func testUniquePaths2() {
    let m = 7, n = 3
    let solution = Solution()
    let result = solution.uniquePaths(m, n)
    XCTAssertEqual(result, 28)
  }
  
}

TestUniquePaths.defaultTestSuite.run()
