/*:
 # 46. Permutations
 
 Given a collection of distinct integers, return all possible permutations.
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 
 func permute(_ nums: [Int]) -> [[Int]] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n!)
 
 **Space Complexity:** O(n!)
 */

func permute(_ nums: [Int]) -> [[Int]] {
  
  guard nums.count > 0 else { return [] }
  
  var results: [[Int]] = []
  dfs(nums, [], &results)
  return results
}

// define recursionn
func dfs(_ nums: [Int], _ subsets: [Int], _ results: inout [[Int]]) {
  
  if subsets.count == nums.count {
    results.append(subsets)
    return
  }
  
  for i in 0 ..< nums.count {
    let num = nums[i]
    if subsets.contains(num) {
      continue
    }
    var mutableSubsets = subsets
    mutableSubsets.append(num)
    dfs(nums, mutableSubsets, &results)
  }
}
/*:
 ## Test
 */
import XCTest

class TestPermutation: XCTestCase {
  
  func testPermutation() {
    let result = permute([1,2,3])
    XCTAssertEqual(result, [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
  }
  
}

TestPermutation.defaultTestSuite.run()

