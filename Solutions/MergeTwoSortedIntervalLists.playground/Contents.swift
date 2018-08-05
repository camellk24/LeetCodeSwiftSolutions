
/*:
 # LinCode 839. Merge Two Sorted Interval Lists
 
 Merge two sorted (ascending) lists of interval and return it as a new sorted list. The new sorted list should be made by splicing together the intervals of the two lists and sorted in ascending order.
 
 Notice
 
 The intervals in the given list do not overlap.
 The intervals in different lists may overlap.
 Example
 Given list1 = [[1,2],[3,4]] and list2 = [[2,3],[5,6]], return [[1,4],[5,6]].
 
 **Implement below function**
 
 func merge(_ list1: [Interval], _ list2: [Interval]) -> [Interval] {
 
 }
 
 */


public class Interval {
  public var start: Int
  public var end: Int
  public init(_ start: Int, _ end: Int) {
    self.start = start
    self.end = end
  }
}

extension Interval: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "[\(start), \(end)]"
  }
}

extension Interval: Equatable {
  public static func ==(lhs: Interval, rhs: Interval) -> Bool {
    return lhs.start == rhs.start && lhs.end == rhs.end
  }
}

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(1)
 */

class Solution {
  
  func merge(_ list1: [Interval], _ list2: [Interval]) -> [Interval] {
    
    var last: Interval?
    var curr: Interval?
    var i = 0
    var j = 0
    var results: [Interval] = []
    
    while i < list1.count && j < list2.count {
      
      let i1 = list1[i]
      let i2 = list2[j]
      
      if i1.start <= i2.start {
        curr = i1
        i += 1
      } else {
        curr = i2
        j += 1
      }
      
      last = merge(last, curr, &results)
    }
    
    while i < list1.count {
      last = merge(last, list1[i], &results)
      i += 1
    }
    
    while j < list2.count {
      last = merge(last, list2[j], &results)
      j += 1
    }
    
    if let last = last {
      results.append(last)
    }
      
    return results
  }
  
  
  private func merge(_ last: Interval?, _ curr: Interval?, _ result: inout [Interval]) -> Interval? {
    
    guard let last = last else {
      return curr
    }
    
    guard let curr = curr else {
      return nil
    }
      
    if curr.start > last.end {
      result.append(last)
      return curr
    }
    
    let newInterval = Interval(last.start, max(last.end , curr.end))
    return newInterval
  }
  
  
}


/*:
 ## Test
 */
import XCTest

class TestMergeTwoSortedIntervalLists: XCTestCase {
  
  func testMergeTwoSortedItervalLists1() {
    let list1 = [Interval(1, 2), Interval(3, 4)]
    let list2 = [Interval(2, 3), Interval(5, 6)]
    let result = Solution().merge(list1, list2)
    XCTAssertEqual(result, [Interval(1, 4), Interval(5, 6)])
  }
  
  func testMergeTwoSortedItervalLists2() {
    let list1 = [Interval(1, 3), Interval(3, 4)]
    let list2 = [Interval(2, 3), Interval(5, 6)]
    let result = Solution().merge(list1, list2)
    XCTAssertEqual(result, [Interval(1, 4), Interval(5, 6)])
  }
  
  func testMergeTwoSortedItervalLists3() {
    let list1 = [Interval(1, 3), Interval(3, 7)]
    let list2 = [Interval(2, 3), Interval(5, 6)]
    let result = Solution().merge(list1, list2)
    XCTAssertEqual(result, [Interval(1, 7)])
  }
}

TestMergeTwoSortedIntervalLists.defaultTestSuite.run()




