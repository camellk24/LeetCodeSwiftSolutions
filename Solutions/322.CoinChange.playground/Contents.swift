/*:
 # 322. Coin Change
 
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Example 1:
 
 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:
 
 Input: coins = [2], amount = 3
 Output: -1
 
 
 func coinChange(_ coins: [Int], _ amount: Int) -> Int {
 
 }
 
 */

/*:
 
 **Time Complexity:** O(amount * coins)
 
 **Space Complexity:** O(amount)
 
 */
class Solution {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    // 0 ... amount
    // initialize with max int
    var f: [Int] = Array(repeating: Int.max, count: amount + 1)
    
    // initialization
    f[0] = 0
    
    for i in 0 ... amount {
      // f[x] = min{ f[x-2]+1, f[x-5]+1, f[x-7]+1 }
      for coin in coins {
        let testCoinValue = i - coin
        if testCoinValue >= 0 && f[testCoinValue] != Int.max {
          f[i] = min(f[i], f[testCoinValue] + 1)
        }
      }
    }
    
    if f[amount] == Int.max {
      return -1
    } else {
      return f[amount]
    }
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestCoinChange: XCTestCase {
  
  func testCoinChange1() {
    let coins = [1, 2, 5]
    let amount = 11
    let solution = Solution()
    let result = solution.coinChange(coins, amount)
    XCTAssertEqual(result, 3)
  }
  
  func testCoinChange2() {
    let coins = [2]
    let amount = 3
    let solution = Solution()
    let result = solution.coinChange(coins, amount)
    XCTAssertEqual(result, -1)
  }
  
}

TestCoinChange.defaultTestSuite.run()
