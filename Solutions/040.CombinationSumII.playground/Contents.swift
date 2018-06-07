/*:
 # 40. Combination Sum II
 
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 Each number in candidates may only be used once in the combination.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 Example 2:
 
 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
 [1,2,2],
 [5]
 ]
 
 func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n!)
 
 **Space Complexity:**
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
  var results: [[Int]] = []
  
  // sort input first for removing dups
  let sortedCandidates = candidates.sorted()
  
  dfs(sortedCandidates, 0, [], target, &results)
  return results
}

// 1. 递归的定义
private func dfs(_ nums: [Int], _ startIndex: Int, _ combinations: [Int], _ target: Int, _ results: inout [[Int]]) {
  
  // 3. 递归的出口
  if target == 0 {
    results.append(combinations)
    return
  }
  
  
  for i in startIndex ..< nums.count {
    
    let number = nums[i]
    
    // skip dups
    if i != startIndex, number == nums[i - 1] {
      continue
    }
    
    if target < number {
      // since it's sorted array, we can just return from here
      break
    }
    
    // 2. 拆分
    var mutableCombinations = combinations
    mutableCombinations.append(number)
    
    // here we need to increment to i + 1, because each candidate can only used once in combination
    dfs(nums, i + 1, mutableCombinations, target - number, &results)
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestCombinationSum2: XCTestCase {
  
  func testCombinationSumII1() {
    let candidates = [10,1,2,7,6,1,5]
    let result = combinationSum2(candidates, 8)
    XCTAssertEqual(result, [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]])
  }
  
  func testCombinationSumII2() {
    let candidates = [2,5,2,1,2]
    let result = combinationSum2(candidates, 5)
    XCTAssertEqual(result, [[1, 2, 2], [5]])
  }
  
}

TestCombinationSum2.defaultTestSuite.run()
