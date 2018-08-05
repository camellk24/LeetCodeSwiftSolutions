/*:
 # 55. Jump Game
 
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Determine if you are able to reach the last index.
 
 Example 1:
 
 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:
 
 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
 jump length is 0, which makes it impossible to reach the last index.
 
 func uniquePaths(_ m: Int, _ n: Int) -> Int {
 
 }
 
 */

/*:
 
 Dynamic Programming
 
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 
 */
class Solution_DP {
  func canJump(_ nums: [Int]) -> Bool {
    
    // f[0] = true
    
    let n = nums.count
    var f: [Bool] = Array(repeating: false, count: n)
    f[0] = true
    
    // f[j] = f[i] && nums[i] + i >= j
    for j in 1 ..< n {
      for i in 0 ..< j {
        // frog can jump from stone 0 to stone j
        // and frog can jump from i to j
        if f[i] && i + nums[i] >= j {
          f[j] = true
          break
        }
      }
    }
    
    return f[n - 1]
  }
}

/*:
 
 Greedy
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */
class Solution_Greedy {
  func canJump(_ nums: [Int]) -> Bool {
    // keep track of the right furthest distance can get to
    
    let len = nums.count
    var rightMost = 0
    
    for i in 0 ..< len {
      
      rightMost = max(rightMost, i + nums[i])
      
      // if we can get to right most index,
      if rightMost == len - 1 {
        return true
      }
      
      // come across 0, couldn't go any further
      if i == rightMost {
        return false
      }
      
    }
    
    return true
  }
}

/*:
 ## Test
 */
import XCTest

class TestJumpGame: XCTestCase {
  
  func testJumpGame1() {
    let input = [2, 3, 1, 1, 4]
    
    let solution_dp = Solution_DP()
    let result_dp = solution_dp.canJump(input)
    XCTAssertTrue(result_dp)
    
    let solution_greedy = Solution_Greedy()
    let result_greedy = solution_greedy.canJump(input)
    XCTAssertTrue(result_greedy)
  }
  
  func testJumpGame2() {
    let input = [3, 2, 1, 0, 4]
    
    let solution_dp = Solution_DP()
    let result = solution_dp.canJump(input)
    XCTAssertFalse(result)
    
    let solution_greedy = Solution_Greedy()
    let result_greedy = solution_greedy.canJump(input)
    XCTAssertFalse(result_greedy)
  }
  
}

TestJumpGame.defaultTestSuite.run()
