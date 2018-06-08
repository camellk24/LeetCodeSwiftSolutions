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
  var permutations: [Int] = []
  
  // used visited to check visited elements
  var visited: [Bool] = []
  for _ in 0 ..< nums.count {
    visited.append(false)
  }
  
  dfs(nums, &permutations, &visited, &results)
  return results
}

// define recursionn
func dfs(_ nums: [Int], _ permutations: inout [Int], _ visited: inout [Bool], _ results: inout [[Int]]) {
  
  if permutations.count == nums.count {
    results.append(permutations)
    return
  }
  
  for i in 0 ..< nums.count {
    if visited[i] {
      continue
    }
    visited[i] = true
    permutations.append(nums[i])
    dfs(nums, &permutations, &visited, &results)
    permutations.removeLast()
    visited[i] = false
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

