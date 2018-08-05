/*:
 # 123. Best Time to Buy and Sell Stock III
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete at most two transactions.
 
 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
 Example 2:
 
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 func maxProfit(_ prices: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP - State Machine 1
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108870/Most-consistent-ways-of-dealing-with-the-series-of-stock-problems
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */


class Solution_State_Machine1 {
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
      return 0
    }
    
    let n = prices.count
    
    // i is 1 ... n
    // s1: T[i][2][0] at ith day, 2 trans allowed, we have 0 stock at the end of day (prev stock sold, or no stock previously)
    // s2: T[i][2][1] at ith day, 2 trans allowed, we have 1 stock at the end of day (hold stock, or buy stock)
    // s3: T[i][1][0] at ith day, 1 trans allowed, we have 0 stock at the end of day (prev stock sold, or no stock previously)
    // s4: T[i][1][1] at ith day, 1 trans allowed, we have 0 stock at the end of day (hold stock, or buy stock)
    
    // Initialization
    
    // s1 -> T[0][2][0] = 0, no stock hold
    var s1 = 0
    
    // s2 -> T[0][2][1] = -inf, with stock but not able to sell
    var s2 = Int.min
    
    // s3 -> T[0][1][0] = 0
    var s3 = 0
    
    // s4 -> -inf
    var s4 = Int.min
    
    for i in 0 ..< n {
      
      let price = prices[i]
      
      // Recurrence Relation
      s1 = max(s1, s2 + price)
      s2 = max(s2, s3 - price)
      s3 = max(s3, s4 + price)
      s4 = max(s4, -price)
    }
    
    return s1
  }
}

/*:
 
 DP - State Machine 2
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/discuss/149383/Easy-DP-solution-using-state-machine-O(n)-time-complexity-O(1)-space-complexity
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution_State_Machine2 {
  func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    /*
 
     s0 --buy--> s1 --sell--> s2 --buy--> s3 --sell--> s4
     |           |            |           |
     r           r            r           r
     
     */
    
    // we assume that we always buy at the beginning, thus, we will only need maintain s1 -> s4
    
    var s1 = -prices[0]
    var s2 = Int.min
    var s3 = Int.min
    var s4 = Int.min
    
    for i in 1 ..< prices.count {
      
      let price = prices[i]
      
      // buy or maintain first time
      s1 = max(s1, -price)
      
      // sell of maintain
      s2 = max(s2, s1 + price)
      
      // buy or maintain after first buy
      s3 = max(s3, s2 - price)
      
      // sell or maintain second time
      s4 = max(s4, s3 + price)
    }
    
    return max(0, s4)
  }
}


/*:
 
 DP - No Rolling Array
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 
 */

class Solution_No_Rolling {
  func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    /* 5 stages:
       1 - before first buy
       2 - bought first, hold stock
       3 - sell first, no holding stock, before second buy
       4 - bought second time, hold stock
       5 - sell second, no stock, can't buy anymore
    */
    
    // 1, 3, 5 -> f[i][j] = max{f[i-1][j-1] + (prices[n-1] - prices[n-2]), f[i-1][j]}
    // 2, 4    -> f[i][j] = max{f[i-1][j] + (prices[n-1] - prices[n-2]), f[i-1][j-1]}
    
    let n = prices.count
    
    // day 1 to day 5
    // 开序列型动态规划，不需要判断两种情况
    let days: [Int] = Array(repeating: Int.min, count: 6)
    var f: [[Int]] = Array(repeating: days, count: n + 1)
    
    // initialization
    f[0][1] = 0
    
    for i in 1 ... prices.count {
      
      for j in stride(from: 1, to: 6, by: 2) {
        // 1, 3, 5 -> f[i][j] = max{f[i-1][j-1] + (prices[n-1] - prices[n-2]), f[i-1][j]}
        f[i][j] = f[i-1][j]
        if i >= 2 && j >= 1 && f[i-1][j-1] != Int.min {
          f[i][j] = max(f[i-1][j-1] + (prices[i-1] - prices[i-2]), f[i][j])
        }
      }
      
      for j in stride(from: 2, to: 5, by: 2) {
        // 2, 4    -> f[i][j] = max{f[i-1][j] + (prices[n-1] - prices[n-2]), f[i-1][j-1]}
        f[i][j] = f[i-1][j-1]
        if i >= 2 && j >= 1 && f[i-1][j] != Int.min {
          f[i][j] = max(f[i-1][j] + (prices[i-1] - prices[i-2]), f[i][j])
        }
      }
    }

    // find max solution
    // find max solution
    var maxProfit = 0
    for k in stride(from: 1, to: 6, by: 2) {
      maxProfit = max(maxProfit, f[n][k])
    }
    return maxProfit
  }
}

/*:
 
 DP - Rolling Array
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution_Rolling {
  func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    /* 5 stages:
     1 - before first buy
     2 - bought first, hold stock
     3 - sell first, no holding stock, before second buy
     4 - bought second time, hold stock
     5 - sell second, no stock, can't buy anymore
     */
    
    // 1, 3, 5 -> f[i][j] = max{f[i-1][j-1] + (prices[n-1] - prices[n-2]), f[i-1][j]}
    // 2, 4    -> f[i][j] = max{f[i-1][j] + (prices[n-1] - prices[n-2]), f[i-1][j-1]}
    
    // day 1 to day 5
    let days: [Int] = Array(repeating: Int.min, count: 6)
    var f: [[Int]] = Array(repeating: days, count: 2)
    
    // initialization
    f[0][1] = 0
    
    var now = 0
    var old = 0
    
    for i in 1 ... prices.count {
      
      old = now
      now = 1 - old
      
      // 1, 3, 5
      for j in stride(from: 1, to: 6, by: 2) {
        // 1, 3, 5 -> f[i][j] = max{f[i-1][j-1] + (prices[n-1] - prices[n-2]), f[i-1][j]}
        f[now][j] = f[old][j]
        if i >= 2 && j >= 1 && f[old][j-1] != Int.min {
          f[now][j] = max(f[old][j-1] + (prices[i-1] - prices[i-2]), f[now][j])
        }
      }
      
      // 2, 4
      for j in stride(from: 2, to: 5, by: 2) {
        // 2, 4    -> f[i][j] = max{f[i-1][j] + (prices[n-1] - prices[n-2]), f[i-1][j-1]}
        f[now][j] = f[old][j-1]
        if i >= 2 && j >= 1 && f[old][j] != Int.min {
          f[now][j] = max(f[old][j] + (prices[i-1] - prices[i-2]), f[now][j])
        }
      }
    }
    
    // find max solution
    var maxProfit = 0
    for k in stride(from: 1, to: 6, by: 2) {
      maxProfit = max(maxProfit, f[now][k])
    }
    return maxProfit
  }
}

/*:
 ## Test
 */
import XCTest

class TestBestTimeToSellStockIII: XCTestCase {
  
  func testBestTimeToSellStockII1() {
    let prices = [3,3,5,0,0,3,1,4]
    
    let solution_state_machine_1 = Solution_State_Machine1()
    let result_state_matchine_1 = solution_state_machine_1.maxProfit(prices)
    
    let solution_state_machine_2 = Solution_State_Machine2()
    let result_state_matchine_2 = solution_state_machine_2.maxProfit(prices)
    
    let solution_no_rolling = Solution_No_Rolling()
    let result_no_rolling = solution_no_rolling.maxProfit(prices)
    
    let solution_rolling = Solution_Rolling()
    let result_rolling = solution_rolling.maxProfit(prices)
    
    XCTAssertEqual(result_state_matchine_1, 6)
    XCTAssertEqual(result_state_matchine_2, 6)
    XCTAssertEqual(result_no_rolling, 6)
    XCTAssertEqual(result_rolling, 6)
  }
  
  func testBestTimeToSellStockII2() {
    let prices = [1,2,3,4,5]
    
    let solution_state_machine_1 = Solution_State_Machine1()
    let result_state_matchine_1 = solution_state_machine_1.maxProfit(prices)
    
    let solution_state_machine_2 = Solution_State_Machine2()
    let result_state_matchine_2 = solution_state_machine_2.maxProfit(prices)

    let solution_no_rolling = Solution_No_Rolling()
    let result_no_rolling = solution_no_rolling.maxProfit(prices)

    let solution_rolling = Solution_Rolling()
    let result_rolling = solution_rolling.maxProfit(prices)

    XCTAssertEqual(result_state_matchine_1, 4)
    XCTAssertEqual(result_state_matchine_2, 4)
    XCTAssertEqual(result_no_rolling, 4)
    XCTAssertEqual(result_rolling, 4)
  }

  func testBestTimeToSellStockII3() {
    let prices = [7,6,4,3,1]
    
    let solution_state_machine_1 = Solution_State_Machine1()
    let result_state_matchine_1 = solution_state_machine_1.maxProfit(prices)
    
    let solution_state_machine_2 = Solution_State_Machine2()
    let result_state_matchine_2 = solution_state_machine_2.maxProfit(prices)

    let solution_no_rolling = Solution_No_Rolling()
    let result_no_rolling = solution_no_rolling.maxProfit(prices)

    let solution_rolling = Solution_Rolling()
    let result_rolling = solution_rolling.maxProfit(prices)

    XCTAssertEqual(result_state_matchine_1, 0)
    XCTAssertEqual(result_state_matchine_2, 0)
    XCTAssertEqual(result_no_rolling, 0)
    XCTAssertEqual(result_rolling, 0)
  }
  
}

TestBestTimeToSellStockIII.defaultTestSuite.run()
