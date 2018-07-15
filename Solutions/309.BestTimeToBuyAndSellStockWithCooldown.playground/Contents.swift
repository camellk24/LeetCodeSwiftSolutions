/*:
 # 309. Best Time to Buy and Sell Stock with Cooldown
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:
 
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 Example:
 
 Input: [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]
 
 func maxProfit(_ prices: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108870/Most-consistent-ways-of-dealing-with-the-series-of-stock-problems
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    let n = prices.count
    // i: 1...n days
    // s1: T[i][0], ith day, no stock at the end of day
    // s2: T[i][1], ith day, have stock at the end of day
    // s3: T[i-1][0], (i-1)th day, have stock, remember for cool down
    
    // reletions
    // T[i][0] = max(T[i-1][0], T[i-1][1] + prices[i]) // hold state or sell if there is stock
    // T[i][1] = max(T[i-1][1], T[i-2][0] - prices[i]) // because of cool down, we can't use i-1, need to use i-2
    
    var s1 = 0
    var s2 = Int.min
    var s3 = 0
    
    
    for i in 0 ..< n {
      
      let price = prices[i]
      
      // remember prev s1 for updating cool down
      let tempS1 = s1
      
      s1 = max(s1, s2 + price)
      s2 = max(s2, s3 - price)
      s3 = tempS1
    }
    
    return s1
  }
}
/*:
 ## Test
 */
import XCTest

class TestBestTimeToSellStockWithCoolDown: XCTestCase {
  
  func testBestTimeToSellStockWithCoolDown() {
    let prices = [1,2,3,0,2]
    let solution = Solution()
    let result = solution.maxProfit(prices)
    XCTAssertEqual(result, 3)
  }
  
}

TestBestTimeToSellStockWithCoolDown.defaultTestSuite.run()
