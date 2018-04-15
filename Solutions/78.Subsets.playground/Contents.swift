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
 ## DFS Solution
 */
func subsets(_ nums: [Int]) -> [[Int]] {
 
  var result = [[Int]]()
  
  dfs(nums: nums, startIndex: 0, subset: [], result: &result)
  
  return result
}

/*:
 ## DFS
 
 **Time Complexity:** O(n!).
 
 **Space Complexity:** O(n).
 
 */
func dfs(nums: [Int], startIndex: Int, subset: [Int], result: inout [[Int]]) {
  
  let sortedNums = nums.sorted(by: <)
  
  result.append(subset)
  
  for i in startIndex ..< nums.count {
    var newSubset = subset
    newSubset.append(nums[i])
    dfs(nums: sortedNums, startIndex: i+1, subset: newSubset, result: &result)
    
    // need to remove the last one
    newSubset.removeLast()
  }
  
}




