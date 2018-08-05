/*:
 # 121.BestTimeToBuyAndSellStock
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Not 7-1 = 6, as selling price needs to be larger than buying price.
 Example 2:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 func maxProfit(_ prices: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 
 */

class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
      return 0
    }
    
    var maxProfit = 0
    var minPrice = prices[0]
    
    for i in 0 ..< prices.count {
      maxProfit = max(maxProfit, prices[i] - minPrice)
      minPrice = min(minPrice, prices[i])
    }
    
    return maxProfit
    
  }
}
/*:
 ## Test
 */
import XCTest

class TestBestTimeToSellStock: XCTestCase {
  
  func testBestTimeToSellStock1() {
    let prices = [7,1,5,3,6,4]
    let solution = Solution()
    let result = solution.maxProfit(prices)
    XCTAssertEqual(result, 5)
  }
  
  func testBestTimeToSellStock2() {
    let prices = [7,6,4,3,1]
    let solution = Solution()
    let result = solution.maxProfit(prices)
    XCTAssertEqual(result, 0)
  }
  
}

TestBestTimeToSellStock.defaultTestSuite.run()
