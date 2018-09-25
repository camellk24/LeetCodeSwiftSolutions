
/*:
 # 339. Nested List Weight Sum
 
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
 
 Each element is either an integer, or a list -- whose elements may also be integers or other lists.
 
 Example 1:
 
 Input: [[1,1],2,[1,1]]
 Output: 10
 Explanation: Four 1's at depth 2, one 2 at depth 1.
 Example 2:
 
 Input: [1,[4,[6]]]
 Output: 27
 Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27.
 
 
 **Implement below function**
 
 func depthSum(_ nestedList: [NestedInteger]) -> Int {
 
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
 **Time Complexity:** O(N)
 
 **Space Complexity:** O(L) - l is the maximum nested level
 */

class Solution {
  func depthSum(_ nestedList: [NestedInteger]) -> Int {
    var sum = 0
    depthSum(nestedList, 1, &sum)
    return sum
  }
  
  
  private func depthSum(_ nestedList: [NestedInteger], _ level: Int, _ sum: inout Int) {
    for nestedInt in nestedList {
      if nestedInt.isInteger() {
        sum += nestedInt.getInteger() * level
      } else {
        let list = nestedInt.getList()
        depthSum(list, level + 1, &sum)
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




