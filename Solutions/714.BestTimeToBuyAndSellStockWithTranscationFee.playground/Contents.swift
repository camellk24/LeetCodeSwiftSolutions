/*:
 # 714. Best Time to Buy and Sell Stock with Transaction Fee
 
 Your are given an array of integers prices, for which the i-th element is the price of a given stock on day i; and a non-negative integer fee representing a transaction fee.
 
 You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction. You may not buy more than 1 share of a stock at a time (ie. you must sell the stock share before you buy again.)
 
 Return the maximum profit you can make.
 
 Example 1:
 Input: prices = [1, 3, 2, 8, 4, 9], fee = 2
 Output: 8
 Explanation: The maximum profit can be achieved by:
 Buying at prices[0] = 1
 Selling at prices[3] = 8
 Buying at prices[4] = 4
 Selling at prices[5] = 9
 The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
 
 func maxProfit(_ prices: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/solution/
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108870/Most-consistent-ways-of-dealing-with-the-series-of-stock-problems
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution {
  func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    var cash = 0
    var hold = -prices[0]
    
    for i in 1 ..< prices.count {
      let price = prices[i]
      cash = max(cash, hold + price - fee)
      
      // NOTE: We can transform cash first without using temporary variables because selling and buying on the same day can't be better than just continuing to hold the stock.
      hold = max(hold, cash - price)
    }
    
    return cash
  }
}

/*:
 ## Test
 */
import XCTest

class TestBestTimeToSellStockWithTransactionFee: XCTestCase {
  
  func testBestTimeToSellStockWithTransactionFee() {
    let solution = Solution()
    let result = solution.maxProfit([1, 3, 2, 8, 4, 9], 2)
    
    XCTAssertEqual(result, 8)
  }
  
}

TestBestTimeToSellStockWithTransactionFee.defaultTestSuite.run()
