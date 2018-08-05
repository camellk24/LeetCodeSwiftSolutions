
/*:
 # 56. Merge Intervals
 
 Given a collection of intervals, merge all overlapping intervals.
 
 Example 1:
 
 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:
 
 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considerred overlapping.
 
 
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
 **Time Complexity:** O(nlogn)
 
 **Space Complexity:** O(n)
 */
class Solution {
  func merge(_ intervals: [Interval]) -> [Interval] {
    
    guard intervals.count > 1 else {
      return intervals
    }
    
    // sort intervals by start
    let sortedIntervals = intervals.sorted(by: { $0.start < $1.start })
    
    var last = sortedIntervals[0]
    var results: [Interval] = []
    
    for i in 1 ..< sortedIntervals.count {
      let curr = sortedIntervals[i]
      if curr.start <= last.end {
        last = Interval(last.start, max(curr.end, last.end))
      } else {
        results.append(last)
        last = curr
      }
    }
    
    // need to append last item
    results.append(last)
    
    return results
  }
}


/*:
 ## Test
 */
import XCTest

class TestMergeIntervals: XCTestCase {
  
  func testMergeIntervals1() {
    let intervals = [Interval(1, 3), Interval(2, 6), Interval(8, 10), Interval(15, 18)]
    let result = Solution().merge(intervals)
    XCTAssertEqual(result, [Interval(1, 6), Interval(8, 10), Interval(15, 18)])
  }
  
  func testMergeIntervals2() {
    let intervals = [Interval(1, 4), Interval(2, 3)]
    let result = Solution().merge(intervals)
    XCTAssertEqual(result, [Interval(1, 4)])
  }
  
  func testMergeIntervals3() {
    let intervals = [Interval(1, 4), Interval(4, 5)]
    let result = Solution().merge(intervals)
    XCTAssertEqual(result, [Interval(1, 5)])
  }
  
}

TestMergeIntervals.defaultTestSuite.run()




