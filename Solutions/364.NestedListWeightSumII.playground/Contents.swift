
/*:
 # 364. Nested List Weight Sum II
 
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
 
 Each element is either an integer, or a list -- whose elements may also be integers or other lists.
 
 Different from the previous question where weight is increasing from root to leaf, now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.
 
 Example 1:
 Given the list [[1,1],2,[1,1]], return 8. (four 1's at depth 1, one 2 at depth 2)
 
 Example 2:
 Given the list [1,[4,[6]]], return 17. (one 1 at depth 3, one 4 at depth 2, and one 6 at depth 1; 1*3 + 4*2 + 6*1 = 17)
 
 
 **Implement below function**
 
 func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
 
 }
 
 */


// This is the interface that allows for creating nested lists.
// You should not implement it, or speculate about its implementation
class NestedInteger {
  
  // Return true if this NestedInteger holds a single integer, rather than a nested list.
  public func isInteger() -> Bool {
    // TODO:
    return false
  }
  
  // Return the single integer that this NestedInteger holds, if it holds a single integer
  // The result is undefined if this NestedInteger holds a nested list
  public func getInteger() -> Int {
    return 0
  }
  
  // Set this NestedInteger to hold a single integer.
  public func setInteger(value: Int) {
    
  }
  
  // Set this NestedInteger to hold a nested list and adds a nested integer to it.
  public func add(elem: NestedInteger) {
    
  }
  
  // Return the nested list that this NestedInteger holds, if it holds a nested list
  // The result is undefined if this NestedInteger holds a single integer
  public func getList() -> [NestedInteger] {
    return []
  }
}

/*:
 
 DFS
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
    // find the maximum depth
    let maxDepth = findMaxDepth(nestedList)
    
    // calculate depth sum
    var result = 0
    
    depthSum(nestedList, maxDepth, &result)
    return result
  }
  
  private func depthSum(_ nestedList: [NestedInteger], _ height: Int, _ result: inout Int) {
    for item in nestedList {
      if item.isInteger() {
        let integer = item.getInteger()
        result += integer * height
      } else {
        let list = item.getList()
        depthSum(list, height - 1, &result)
      }
    }
  }
  
  private func findMaxDepth(_ nestedList: [NestedInteger]) -> Int {
    var maxDepth = 0
    for item in nestedList {
      if item.isInteger() {
        maxDepth = max(maxDepth, 1)
      } else {
        let list = item.getList()
        maxDepth = max(findMaxDepth(list) + 1, maxDepth)
      }
    }
    return maxDepth
  }
}

/*:

 Using array solution
 
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(L) - l is the maximum nested level
 */

class Solution_Array {
  func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
    var levelSum: [Int] = []
    dfs(nestedList, 0, &levelSum)
    var sum = 0
    
    var weight = 1
    var i = levelSum.count - 1
    
    while i >= 0 {
      let level = levelSum[i]
      sum += level * weight
      weight += 1
      i -= 1
    }
    
    return sum
  }
  
  private func dfs(_ nestedList: [NestedInteger], _ level: Int, _ levelSum: inout [Int]) {
    
    // increase level sum capacity for new level
    if levelSum.count < level + 1 {
      levelSum.append(0)
    }
    
    for item in nestedList {
      if item.isInteger() {
        let integer = item.getInteger()
        levelSum[level] += integer
      } else {
        let list = item.getList()
        dfs(list, level + 1, &levelSum)
      }
    }
  }
}

/*:
 ## Test
 */
import XCTest

class TestShortestWordDistance: XCTestCase {
  
}

TestShortestWordDistance.defaultTestSuite.run()




