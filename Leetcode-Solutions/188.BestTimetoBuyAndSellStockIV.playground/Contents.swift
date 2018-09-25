/*:
 # 188. Best Time to Buy and Sell Stock IV
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete at most k transactions.
 
 Note:
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [2,4,1], k = 2
 Output: 2
 Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
 Example 2:
 
 Input: [3,2,6,5,0,3], k = 2
 Output: 7
 Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4.
 Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 
 func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108870/Most-consistent-ways-of-dealing-with-the-series-of-stock-problems
 
 **Time Complexity:** O(nk)
 
 **Space Complexity:** O(k)
 
 */

class Solution {
  func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    
    let n = prices.count
    
    guard n > 0 && k > 0 else {
      return 0
    }
    
    // It doesn't gain any profit if we just buy and sell at the same day, thus
    // if k >= n/2, it's basically equivalent to unlimited transactions
    
    if k >= n/2 {
      
      // States
      // s1: T[i][0] - ith day, no stock at the end of day
      // s2: T[i][1] - ith day, hold stock at the end of day
      
      
      // Recurrence
      // T[i][0] = max(T[i-1][0], T[i-1][1] + prices[i])
      // T[i][1] = max(T[i-1][1], T[i-1][0] - prices[i])
      
      var s1 = 0
      var s2 = Int.min
      
      
      for i in 0 ..< prices.count {
        let price = prices[i]
        s1 = max(s1, s2 + price)
        s2 = max(s2, s1 - price)
      }
      
      return s1
      
    } else {
      
      // States
      // s1: T[i][k][0] - ith day, with k transaction allowed, no stock at the end of day
      // s2: T[i][k][1] - ith day, with k transaction allowed, hold stock at the end of day
      
      
      // Recurrence
      // T[i][k][0] = max(T[i-1][k][0], T[i-1][k][1] + prices[i])
      // T[i][k][1] = max(T[i-1][k][1], T[i-1][k-1][0] - prices[i])
      
      var s1: [Int] = Array(repeating: Int.min, count: k + 1)
      var s2: [Int] = Array(repeating: Int.min, count: k + 1)
      
      
      s1[0] = 0
      
      for i in 0 ..< prices.count {
        
        let price = prices[i]
        
        for k in 1 ... k {
          s1[k] = max(s1[k], s2[k] + price)
          s2[k] = max(s2[k], s1[k-1] - price)
        }
      }
      
      return s1[k]
      
    }
    
  }
}
/*:
 ## Test
 */
import XCTest

class TestBestTimeToSellStockIV: XCTestCase {
  
  func testBestTimeToSellStockIV1() {
    let solution = Solution()
    let result = solution.maxProfit(2, [2,4,1])
    XCTAssertEqual(result, 2)
  }
  
  func testBestTimeToSellStockIV2() {
    let solution = Solution()
    let result = solution.maxProfit(2, [3,2,6,5,0,3])
    XCTAssertEqual(result, 7)
  }
  
}

TestBestTimeToSellStockIV.defaultTestSuite.run()
