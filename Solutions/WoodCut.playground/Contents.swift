
/*:
 # Wood Cut
 
 Description
 Given n pieces of wood with length L[i] (integer array). Cut them into small pieces to guarantee you could have equal or more than k pieces with the same length. What is the longest length you can get from the n pieces of wood? Given L & k, return the maximum length of the small pieces.
 
 You couldn't cut wood into float length.
 
 If you couldn't get >= k pieces, return 0.
 
 Have you met this question in a real interview?
 Example
 For L=[232, 124, 456], k=7, return 114.
 
 Challenge
 O(n log Len), where Len is the longest length of the wood.
 
 **Implement below function**
 
 func search(_ nums: [Int], _ target: Int) -> Int {
 
 }
 
 */

/*:
 **Time Complexity:** O(nlog(max(Length)))
 
 n -> nums of woods, everytime when count number of woods
 L -> max wood length
 
 **Space Complexity:** O(1)
 */
class Solution {
  func woodCut(_ L: [Int], _ k: Int) -> Int {
    
    guard L.count > 0 else {
      return 0
    }
    
    let maxL = findMaxL(L)
    
    if maxL == Int.min || maxL == 0 {
      return 0
    }
    
    var start = 1
    var end = maxL
    
    while start + 1 < end {
      
      let mid = (end - start) / 2 + start
      
      let count = countPieces(L, mid)
      
      if count >= k {
        start = mid
      } else {
        end = mid
      }
    }
    
    if (countPieces(L, end)) >= k {
      return end
    } else if (countPieces(L, start)) >= k {
      return start
    }
    
    return -1
  }
  
  private func countPieces(_ L: [Int], _ unitL: Int) -> Int {
    var sum = 0
    for i in 0 ..< L.count {
      sum += (L[i] / unitL)
    }
    return sum
  }
  
  private func findMaxL(_ L: [Int]) -> Int {
    var maxL = Int.min
    for i in 0 ..< L.count {
      maxL = max(L[i], maxL)
    }
    return maxL
  }
}

/*:
 ## Test
 */
import XCTest

class TestWoodCut: XCTestCase {

  func testSearch() {
    let L = [232, 124, 456]
    let k = 7
    let result = Solution().woodCut(L, k)
    XCTAssertEqual(result, 114)
  }
  
}

TestWoodCut.defaultTestSuite.run()




