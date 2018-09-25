/*:
 # 39. Combination Sum
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 Example 2:
 
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]
 
 func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n!)
 
 **Space Complexity:**
 */
class Solution {
  
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    
    var result: [[Int]] = []
    
    guard candidates.count > 0 else {
      return result
    }
    
    // sort array to remove some unnecessary iterations
    let sortedCandidates = candidates.sorted()
    
    // remove dups
    let nums = removeDuplicates(sortedCandidates)
    
    helper(nums, 0, [], target, &result)
    
    return result
  }
  
  // 1. 定义递归
  private func helper(_ nums: [Int], _ startIndex: Int, _ combinations: [Int], _ target: Int, _ result: inout [[Int]]) {
    
    // 3. 递归出口
    
    if target == 0 {
      result.append(combinations)
      return
    }
    
    
    for i in startIndex ..< nums.count {
      
      let num = nums[i]
      
      if num > target {
        break
      }
      
      // 2. 递归的拆解
      var mutableCombinations = combinations
      mutableCombinations.append(num)
      
      // here we don't need to increment i + 1, because one element can be used unlimited times
      helper(nums, i, mutableCombinations, target - num, &result)
    }
    
  }
  
  private func removeDuplicates(_ nums: [Int]) -> [Int] {
    var index = 0
    var _nums = nums
    
    for i in 0 ..< _nums.count {
      if _nums[i] != _nums[index] {
        index += 1
        _nums[index] = _nums[i]
      }
    }
    
    var result: [Int] = Array(repeating: 0, count: index + 1)
    
    for j in 0 ... index {
      result[j] = _nums[j]
    }
    
    return result
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestCombinationSum: XCTestCase {
  
  func testCombinationSum1() {
    let candidates = [2,3,6,7]
    let result = Solution().combinationSum(candidates, 7)
    XCTAssertEqual(result, [[2, 2, 3], [7]])
  }
  
  func testCombinationSum2() {
    let candidates = [2,3,5]
    let result = Solution().combinationSum(candidates, 8)
    XCTAssertEqual(result, [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
  }
  
}

TestCombinationSum.defaultTestSuite.run()
