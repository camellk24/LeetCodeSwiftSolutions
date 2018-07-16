/*:
 # 300. Longest Increasing Subsequence
 

 Given an unsorted array of integers, find the length of longest increasing subsequence.
 
 Example:
 
 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Note:
 
 There may be more than one LIS combination, it is only necessary for you to return the length.
 Your algorithm should run in O(n2) complexity.
 Follow up: Could you improve it to O(n log n) time complexity?
 
 func lengthOfLIS(_ nums: [Int]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 
 */

class Solution {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    
    let n = nums.count
    
    guard n > 0 else {
      return 0
    }
    
    // iterate through each number
    // f[i] = max {1, f[j] + 1|j<i & nums[j] < nums[i]}
    // f[i] means with nums[i] as last number, the longest increasing sequence
    
    var f: [Int] = Array(repeating: 0, count: nums.count)
    
    for i in 0 ..< nums.count {
      f[i] = 1
      for j in 0 ..< i {
        if nums[j] < nums[i] {
          f[i] = max(f[i], f[j] + 1)
        }
      }
    }

    var maxLength = 0
    for k in 0 ..< n {
      maxLength = max(maxLength, f[k])
    }
    
    return maxLength
  }
}

/*:
 
 DP + Binary Search
 
 **Time Complexity:** O(nlog(n))
 
 **Space Complexity:** O(n)
 
 */
class Solution_Binary_Search {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    
    let n = nums.count
    
    guard n > 0 else {
      return 0
    }
    
    //    10, 9, 2, 5, 3, 7, 101, 18
    //  f  1  1  1  2
    // looking at 10 -> 1, 9 -> 1, we will not use 10 -> 1 because they have same number of subsequence but 10 requires larger number, so we just need to remember 9
    // similarly, when we have 9 -> 1, 2 -> 1, we know that we can ignore 9 and just remember 2 -> 1
    // looking at 2 -> 1, 5 -> 2, we can tell that if we know find the largest number in previous numbers that small than current one, we can increment by 1
    // we can use binary search
    
    // -inf, inf, ....
    // init array with n + 1 size
    // set first one to negative inf and the rest to inf
    // then we can use binary search
    var f: [Int] = Array(repeating: Int.max, count: n + 1)
    f[0] = Int.min
    
    var maxCount = 0
    
    for i in 0 ..< n {
      let num = nums[i]
      let index = binarySearch(f, num)
      f[index] = num
      maxCount = max(index, maxCount)
    }
    
    return maxCount
  }
  
  
  ///  Find the first number > target
  ///
  /// - Parameters:
  ///   - nums:
  ///   - target:
  /// - Returns:
  private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    
    while (start + 1 < end) {
      let mid = (end - start) / 2 + start
      if nums[mid] < target {
        start = mid
      } else {
        end = mid
      }
    }
    return end
  }
}
  
  

/*:
 ## Test
 */
import XCTest

class TestLongestIncreasingSubsequence: XCTestCase {
  
  func testLongestIncreasingSubsequence1() {
    
    let input = [10,9,2,5,3,7,101,18]
    
    let solution = Solution()
    let result = solution.lengthOfLIS(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.lengthOfLIS(input)
    
    XCTAssertEqual(result, 4)
    XCTAssertEqual(result_binary_search, 4)
  }
  
  func testLongestIncreasingSubsequence2() {
    
    let input = [1,3,6,7,9,4,10,5,6]
    
    let solution = Solution()
    let result = solution.lengthOfLIS(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.lengthOfLIS(input)
    
    XCTAssertEqual(result, 6)
    XCTAssertEqual(result_binary_search, 6)
  }
  
  
  
}

TestLongestIncreasingSubsequence.defaultTestSuite.run()
