
/*:
 # Intersection of Two Sorted Interval Lists
 
 https://www.careercup.com/question?id=5682567566065664
 
 Get intersection of two sorted (ascending) lists of interval and return it as a new sorted list. The new sorted list should be made by splicing together the intervals of the two lists and sorted in ascending order.
 
 Notice
 
 The intervals in the given list do not overlap.
 The intervals in different lists may overlap.
 
 Example
 
 Given list1 = [[1,2],[3,4]] and list2 = [[2,3],[5,6]], return [2, 3].
 
 Given list1 = [[1,3],[5,6]] and list2 = [[2,3],[5,6]], return [[2,3], [5,6]].
 
 Given list1 = [[1,4],[7,9]] and list2 = [[3,8]], return [[3,4], [7,8]].

 
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
 **Time Complexity:** O(max(m, n))
 
 **Space Complexity:** O(m + n)
 */

class Solution {
  
  func intersection(_ list1: [Interval], _ list2: [Interval]) -> [Interval] {
    
    var i = 0
    var j = 0
    var results: [Interval] = []
    
    // merge continuous intervals, e.g. [1,2] and [3, 4], so that we can include [2, 3] as interval
    let mergedList1 = mergeContinuousIntervals(list1)
    let mergedList2 = mergeContinuousIntervals(list2)
    
    while i < mergedList1.count && j < mergedList2.count {

      let i1 = mergedList1[i]
      let i2 = mergedList2[j]
      
      intersect(i1, i2, &results)
      
      if i1.end >= i2.end {
        j += 1
      } else {
        i += 1
      }
    }
    
    return results
  }
  
  private func mergeContinuousIntervals(_ list: [Interval]) -> [Interval] {
    
    guard list.count > 1 else {
      return list
    }
    var last: Interval = list[0]
    var result: [Interval] = []
    for i in 1 ..< list.count {
      let curr = list[i]
      if last.end + 1 == curr.start {
        let newInterval = Interval(last.start, curr.end)
        last = newInterval
      } else {
        result.append(last)
        last = curr
      }
    }
    result.append(last)
    return result
  }
  
  private func intersect(_ i1: Interval, _ i2: Interval, _ result: inout [Interval]) {
    let maxLb = max(i1.start, i2.start)
    let minUb = min(i1.end, i2.end)
    
    if maxLb < minUb {
      result.append(Interval(maxLb, minUb))
    }
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
    
    let result = Solution().intersection(list1, list2)
    XCTAssertEqual(result, [Interval(2, 3)])
  }
  
  func testMergeTwoSortedItervalLists2() {
    let list1 = [Interval(1, 2), Interval(3, 4)]
    let list2 = [Interval(3, 6)]
    let result = Solution().intersection(list1, list2)
    XCTAssertEqual(result, [Interval(3, 4)])
  }
  
  func testMergeTwoSortedItervalLists3() {
    let list1 = [Interval(1, 2), Interval(3, 4)]
    let list2 = [Interval(1, 10)]
    let result = Solution().intersection(list1, list2)
    XCTAssertEqual(result, [Interval(1, 4)])
  }
  
  func testMergeTwoSortedItervalLists4() {
    let list1 = [Interval(1, 2), Interval(5, 7)]
    let list2 = [Interval(1, 10)]
    let result = Solution().intersection(list1, list2)
    XCTAssertEqual(result, [Interval(1, 2), Interval(5,7)])
  }
  
  func testMergeTwoSortedItervalLists5() {
    let list1 = [Interval(1, 2), Interval(5, 12)]
    let list2 = [Interval(1, 10)]
    let result = Solution().intersection(list1, list2)
    XCTAssertEqual(result, [Interval(1, 2), Interval(5, 10)])
  }
  
}

TestMergeTwoSortedIntervalLists.defaultTestSuite.run()




