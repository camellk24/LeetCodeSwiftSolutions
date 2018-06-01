
/*:
 # 69. Sqrt(x)
 
 Implement int sqrt(int x).
 
 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 
 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 
 **Example:**
 
 Example 1:
 
 Input: 4
 Output: 2
 Example 2:
 
 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
 the decimal part is truncated, 2 is returned.
 
 **Implement below function**
 
 func mySqrt(_ x: Int) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(1)
 */
func mySqrt(_ x: Int) -> Int {
  
  if x == 0 {
    return 0
  }
  
  var start = 1
  // Binary Search, right should start with x / 2 + 1, thus its square is x + x ^ 2 / 4 + 1,
  // which is definitely greater than x
  var end = x / 2 + 1
  
  while (start + 1 < end) {
    
    let mid = (end - start) / 2  + start
    
    let midPowerTwo = mid * mid
    
    if midPowerTwo == x {
      return mid
    } else if midPowerTwo < x {
      start = mid
    } else {
      end = mid
    }
    
  }
  
  return start
}


/*:
 ## Test
 */
import XCTest

class TestSqrtX: XCTestCase {
  
  func testSqrtX() {
    let result = mySqrt(8)
    XCTAssertEqual(result, 2)
  }
  
  
}

TestSqrtX.defaultTestSuite.run()




