/*:
 # Digital Flip
 
 Give you an array of 01. Find the minimum number of flipping steps so that the array meets the following rules: The back of 1 can be either1 or 0, but0 must be followed by 0.
 
 Notice
 
 The length of the given array n <= 100000.
 Example
 Given array = [1,0,0,1,1,1], return 2.
 
 Explanation:
 Turn two 0s into 1s.
 Given array = [1,0,1,0,1,0], return 2.
 
 Explanation:
 Turn the second 1 and the third 1 into 0.
 
 
 func flipDigit(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP - No roling array
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */
class Solution_No_Rolling_Array {
  
  func flipDigit(_ nums: [Int]) -> Int {

    let n = nums.count
    
    guard n >= 1 else {
      return 0
    }
      
    let defaultRow = Array(repeating: Int.max, count: n + 1)
    
    // 2D array to record when last digit is 1 or 0, least number of flips
    var dp = Array(repeating: defaultRow, count: 2)
    
    // initialization
    dp[0][0] = 0
    dp[1][0] = 0
    
    for i in 1 ... nums.count {
      // try change nums[i-1] to j
      for j in 0 ... 1 {
        
        // try change nums[i-2] to k
        for k in 0 ... 1 {
          
          // when 0 1, ignore
          if (j == 1 && k == 0) {
            continue
          }
          
          var flips = dp[k][i-1]
          // need to flip
          if (j != nums[i-1]) {
            flips = flips + 1
          }
          
          dp[j][i] = flips
        }
      }
      
    }
    
    return min(dp[0][n], dp[1][n])
    
  }
}

/*:
 
 DP - Roling array
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */
class Solution_Rolling_Array {
  
  func flipDigit(_ nums: [Int]) -> Int {
    
    let n = nums.count
    
    guard n >= 1 else {
      return 0
    }
    
//    let defaultRow = Array(repeating: Int.max, count: n + 1)
    
    let defaultRow = Array(repeating: Int.max, count: 2)
    
    // 2D array to record when last digit is 1 or 0, least number of flips
    var dp = Array(repeating: defaultRow, count: 2)
    
    // initialization
    dp[0][0] = 0
    dp[1][0] = 0
    
    var old = 0
    var now = 0
    
    for _ in 1 ... nums.count {
      
      old = now
      now = 1 - old
      
      // try change nums[i-1] to j
      for j in 0 ... 1 {
        
        // try change nums[i-2] to k
        for k in 0 ... 1 {
          
          // when 0 1, ignore
          if (j == 1 && k == 0) {
            continue
          }
          
          var flips = dp[k][old]
          // need to flip
          if (j != nums[old]) {
            flips = flips + 1
          }
          
          dp[j][now] = flips
        }
      }
      
    }
    
    return min(dp[0][now], dp[1][now])
    
  }
}

/*:
 ## Test
 */
import XCTest

class TestDigitalFlip: XCTestCase {
  
  func testDigitalFlip1() {
    let input = [1, 0, 0, 1, 1, 1]
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.flipDigit(input)
    XCTAssertEqual(result_no_rolling, 2)
    
    let solution_rolling = Solution_Rolling_Array()
    let result_rolling = solution_rolling.flipDigit(input)
    XCTAssertEqual(result_rolling, 2)
  }
  
  func testDigitalFlip2() {
    let input = [1, 0, 1, 0, 1, 1]
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.flipDigit(input)
    XCTAssertEqual(result_no_rolling, 2)
    
    let solution_rolling = Solution_Rolling_Array()
    let result_rolling = solution_rolling.flipDigit(input)
    XCTAssertEqual(result_rolling, 2)
  }
  
  func testDigitalFlip3() {
    let input = [0, 1]
    
    let solution_no_rolling = Solution_No_Rolling_Array()
    let result_no_rolling = solution_no_rolling.flipDigit(input)
    XCTAssertEqual(result_no_rolling, 1)
    
    let solution_rolling = Solution_Rolling_Array()
    let result_rolling = solution_rolling.flipDigit(input)
    XCTAssertEqual(result_rolling, 1)
  }
  
}

TestDigitalFlip.defaultTestSuite.run()
