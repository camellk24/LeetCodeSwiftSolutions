/*:
 # 90. Subsets II
 
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: [1,2,2]
 Output:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]
 
 func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n * 2^n)
 
 **Space Complexity:** O(n * 2^n)
 */

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
  var results: [[Int]] = []
  
  // sort array for ease of cheching dups
  let sortedNums = nums.sorted()
  
  dfs(sortedNums, 0, [], &results)
  return results
}

// 1. define recursion
func dfs(_ nums: [Int], _ startIndex: Int, _ subsets: [Int], _ results: inout [[Int]]) {
  
  // append results
  results.append(subsets)
  
  for i in startIndex ..< nums.count {
    
    let num = nums[i]
    
    // check duplicates here
    if i != startIndex, num == nums[i - 1] {
      continue
    }
    
    // 2. separation
    var mutableSubsets: [Int] = subsets
    mutableSubsets.append(num)
    dfs(nums, i+1, mutableSubsets, &results)
  }
  
}

/*:
 ## Test
 */
import XCTest

class TestSubsetII: XCTestCase {
  
  func testSubsetII() {
    let candidates = [1,2,2]
    let result = subsetsWithDup(candidates)
    XCTAssertEqual(result, [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]])
  }
  
}

TestSubsetII.defaultTestSuite.run()

