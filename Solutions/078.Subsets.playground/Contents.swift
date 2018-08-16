/*:
 # 78. Subsets
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 
 */

/*:
 ## DFS
 
 **Time Complexity:** O(n *2^n).
 
 O(答案个数 * 构造每个答案的时间）
 
 子集个数 2^n, 每个集合的平均长度是O(n) -> O(n * 2^n)
 
 **Space Complexity:** O(n).
 
 */
class Solution {
  func subsets(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
      return []
    }
    
    var result: [[Int]] = []
    dfs(nums, 0, [], &result)
    return result
  }
  
  private func dfs(_ nums: [Int], _ startIndex: Int, _ subset: [Int], _ result: inout [[Int]]) {
    
    result.append(subset)
    
    for i in startIndex ..< nums.count {
      var newSubset = subset
      newSubset.append(nums[i])
      dfs(nums, i + 1, newSubset, &result)
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestSubsets: XCTestCase {
  
  func testSubsets() {
    let input = [1, 2, 3]
    let results = Solution().subsets(input)
    let expected = [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
    XCTAssertEqual(Set(results), Set(expected))
  }
  
}

TestSubsets.defaultTestSuite.run()




