/*:
 # 338. Counting Bits
 
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
 Example:
 For num = 5 you should return [0,1,1,2,1,2].
 
 Follow up:
 
 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 
 func countBits(_ num: Int) -> [Int] {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */
class Solution {
  func countBits(_ num: Int) -> [Int] {
    guard num > 0 else {
      return [0]
    }
    
    var f: [Int] = Array(repeating: 0, count: num + 1)
    f[0] = 0
    
    for i in 1 ... num {
      // f[i] = f[i>>1] + (i mod 2)
      f[i] = f[i>>1] + i % 2
    }
    
    return f
  }
}
/*:
 ## Test
 */
import XCTest

class TestCountingBits: XCTestCase {
  
  func testCountingBits() {
    let num = 5
    let solution = Solution()
    let result = solution.countBits(num)
    XCTAssertEqual(result, [0, 1, 1, 2, 1, 2])
    
  }
  
}

TestCountingBits.defaultTestSuite.run()
