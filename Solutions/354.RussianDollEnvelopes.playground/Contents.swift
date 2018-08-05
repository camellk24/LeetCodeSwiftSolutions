/*:
 # 354. Russian Doll Envelopes
 
 You have a number of envelopes with widths and heights given as a pair of integers (w, h). One envelope can fit into another if and only if both the width and height of one envelope is greater than the width and height of the other envelope.
 
 What is the maximum number of envelopes can you Russian doll? (put one inside other)
 
 Example:
 Given envelopes = [[5,4],[6,4],[6,7],[2,3]], the maximum number of envelopes you can Russian doll is 3 ([2,3] => [5,4] => [6,7]).
 
 func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
 
 }
 
 */

/*:
 
 DP
 
 **Time Complexity:** O(n^2)
 
 **Space Complexity:** O(n)
 
 */

class Solution {
  func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    
    let n = envelopes.count
    
    guard n > 0 else {
      return 0
    }
    
    // sort one dimension by w
    // and then sort by l
    // O(nlogn)
    // if same width, put the length in front, this way when checking longest increasing subsequence, we don't need to consider width
    let sortedEnvelopes = envelopes.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
    
    // find longest increasing subsequence in sorted l, satisfying w1 < w2
    // f[i] = max {1, f[j] + 1 | j < i, sortedL[j] < sortedL[i] }
    var f: [Int] = Array(repeating: 0, count: n)

    for i in 0 ..< sortedEnvelopes.count {
      f[i] = 1
      for j in 0 ..< i {
        let ej = sortedEnvelopes[j]
        let ei = sortedEnvelopes[i]
        if ej[1] < ei[1] {
          f[i] = max(f[i], f[j] + 1)
        }
      }
    }
    
    // find max result
    var maxEnv = 0
    
    for i in 0 ..< n {
      maxEnv = max(maxEnv, f[i])
    }
    
    return maxEnv
  }
}


/*:
 
 DP + Binary Search
 
 **Time Complexity:** O(nlog(n))
 
 **Space Complexity:** O(n)
 
 */
class Solution_Binary_Search {
  func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    
    let n = envelopes.count
    
    guard n > 0 else {
      return 0
    }
    
    // sort one dimension by w
    // and then sort by l
    // O(nlogn)
    // if same width, put the length in front, this way when checking longest increasing subsequence, we don't need to consider width
    let sortedEnvelopes = envelopes.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
    
    // find longest increasing subsequence in sorted l, satisfying w1 < w2
    
    var f: [Int] = Array(repeating: Int.max, count: n + 1)
    f[0] = Int.min
    
    var maxEnv = 1
    for i in 0 ..< n {
      let e = sortedEnvelopes[i]
      let l = e[1]
      let index = binarySearch(f, l)
      f[index] = l
      
      maxEnv = max(maxEnv, index)
    }
    
    return maxEnv
  }
  
  
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

class TestRussianDollEnvelops: XCTestCase {
  
  func testRussianDollEnvelops1() {
    let input = [[5,4],[6,4],[6,7],[2,3]]
    let ans = 3
    
    let solution = Solution()
    let result = solution.maxEnvelopes(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.maxEnvelopes(input)
    
    XCTAssertEqual(result, ans)
    XCTAssertEqual(result_binary_search, ans)
  }
  
  func testRussianDollEnvelops2() {
    let input = [[4,5],[4,6],[6,7],[2,3],[1,1]]
    let ans = 4
    
    let solution = Solution()
    let result = solution.maxEnvelopes(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.maxEnvelopes(input)
    
    XCTAssertEqual(result, ans)
    XCTAssertEqual(result_binary_search, ans)
  }
  
  func testRussianDollEnvelops3() {
    let input = [[1,1]]
    let ans = 1
    
    let solution = Solution()
    let result = solution.maxEnvelopes(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.maxEnvelopes(input)
    
    XCTAssertEqual(result, ans)
    XCTAssertEqual(result_binary_search, ans)
  }
  
  func testRussianDollEnvelops4() {
    let input = [[4,5],[6,7],[2,3]]
    let ans = 3
    
    let solution = Solution()
    let result = solution.maxEnvelopes(input)
    
    let solution_binary_search = Solution_Binary_Search()
    let result_binary_search = solution_binary_search.maxEnvelopes(input)
    
    XCTAssertEqual(result, ans)
    XCTAssertEqual(result_binary_search, ans)
  }
  
  
  
}

TestRussianDollEnvelops.defaultTestSuite.run()
