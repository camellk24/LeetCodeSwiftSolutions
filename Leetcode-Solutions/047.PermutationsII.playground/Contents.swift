/*:
 # 47. Permutations II
 
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 
 Example:
 
 Input: [1,1,2]
 Output:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 
 func permuteUnique(_ nums: [Int]) -> [[Int]] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n!) 
 
 **Space Complexity:** O(n!)
 */

func permuteUnique(_ nums: [Int]) -> [[Int]] {
  var results: [[Int]] = []
  guard nums.count > 0 else {
    return results
  }
  
  var visited: [Bool] = []
  for _ in 0 ..< nums.count {
    visited.append(false)
  }
  
  
  var permutations: [Int] = []
  
  dfs(nums.sorted(), &permutations, &visited, &results)
  return results
}

// dfs - define recursion
private func dfs(_ nums: [Int], _ permutations: inout [Int], _ visited: inout [Bool], _ results: inout [[Int]]) {
  
  if permutations.count == nums.count {
    results.append(permutations)
    return
  }
  
  for i in 0 ..< nums.count {
    
    if visited[i] {
      continue
    }
    
    // if two dups swap position, the result is the same.
    // thus, we force two dups first one has to visit first
    // thus, if first never visited, then second should not be visited
    
    if (i>0) && (nums[i] == nums[i - 1] && !visited[i-1]) {
      continue
    }
    
    permutations.append(nums[i])
    visited[i] = true
    dfs(nums, &permutations, &visited, &results)
    permutations.removeLast()
    visited[i] = false
  }
  
}


/*:
 ## Test
 */
import XCTest

class TestPermutationII: XCTestCase {
  
  func testPermutationII() {
    let result = permuteUnique([1, 1, 2])
    XCTAssertEqual(result, [[1, 1, 2], [1, 2, 1], [2, 1, 1]])
  }
  
}

TestPermutationII.defaultTestSuite.run()

