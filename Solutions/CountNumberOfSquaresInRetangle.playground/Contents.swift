
/*:
 # Count number of squares in a rectangle
 */

/*:
 **Time Complexity:** O(min(m, n))
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  func countSquares(_ m: Int, _ n: Int) -> Int {
    var result = 0
    let minEdge = min(m, n)
    for i in 1 ... minEdge {
      // m - i + 1 means the amount of steps the square can move on m plus it's own
      // n - i + 1 means the amount of steps the square can move on n plus it's own
      result += (m - i + 1) * (n - i + 1)
    }
    return result
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestCountSquares: XCTestCase {
  
  func testCountSquares1() {
    let m = 1
    let n = 1
    let solution = Solution()
    let result = solution.countSquares(m, n)
    XCTAssertEqual(result, getAns(m, n))
  }
  
  func testCountSquares2() {
    let m = 2
    let n = 2
    let solution = Solution()
    let result = solution.countSquares(m, n)
    XCTAssertEqual(result, getAns(m, n))
  }
  
  func testCountSquares3() {
    let m = 3
    let n = 3
    let solution = Solution()
    let result = solution.countSquares(m, n)
    XCTAssertEqual(result, getAns(m, n))
  }
  
  func testCountSquares4() {
    let m = 2
    let n = 1
    let solution = Solution()
    let result = solution.countSquares(m, n)
    XCTAssertEqual(result, getAns(m, n))
  }
  
  func testCountSquares5() {
    let m = 10
    let n = 11
    let solution = Solution()
    let result = solution.countSquares(m, n)
    XCTAssertEqual(result, getAns(m, n))
  }
  
  func getAns(_ m: Int, _ n: Int) -> Int {
    let maxEdge = max(m, n)
    let minEdge = min(m, n)
    return minEdge * (minEdge + 1) * (2 * minEdge + 1) / 6 + (maxEdge - minEdge) * minEdge * (minEdge + 1) / 2
  }
  
}

TestCountSquares.defaultTestSuite.run()



