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

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
  
  var result: [[Int]] = []
  
  guard candidates.count > 0 else {
    return result
  }
  
  // 1. 定义递归
  var combinations: [Int] = []
  helper(candidates, 0, &combinations, target, &result)
  
  return result
}

private func helper(_ nums: [Int], _ startIndex: Int, _ combinations: inout [Int], _ target: Int, _ result: inout [[Int]]) {
  
  // 3. 递归出口
  
  if target == 0 {
    result.append(combinations)
    return
  }
  
  // 2. 递归的拆解
  for i in startIndex ..< nums.count {
    
    if nums[i] > target {
      continue
    }
    
    combinations.append(nums[i])
    helper(nums, i, &combinations, target - nums[i], &result)
    combinations.removeLast()
  }
}

/*:
 ## Test
 */
import XCTest

class TestCombinationSum: XCTestCase {
  
  func testCombinationSum1() {
    let candidates = [2,3,6,7]
    let result = combinationSum(candidates, 7)
    XCTAssertEqual(result, [[2, 2, 3], [7]])
  }
  
  func testCombinationSum2() {
    let candidates = [2,3,5]
    let result = combinationSum(candidates, 8)
    XCTAssertEqual(result, [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
  }
  
}

TestCombinationSum.defaultTestSuite.run()
